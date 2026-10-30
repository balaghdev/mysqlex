defmodule Mysqlex.Client do
  @moduledoc """
  Reads and writes packets over a `Mysqlex.Transport`, and runs the connection
  phase.

  This is where the socket lives. Everything it hands upwards is a whole
  message, so no parser above it ever sees a partial read.
  """

  alias Mysqlex.Auth.NativePassword
  alias Mysqlex.Packet
  alias Mysqlex.Protocol.{Codec, Err, Handshake, HandshakeResponse, Ok}

  defstruct [:transport, :socket, :capabilities, :connection_id, :server_version, buffer: ""]

  @default_port 3306
  @default_timeout 5_000

  @doc """
  Opens a connection and completes the connection phase.
  """
  def connect(opts) do
    transport = Keyword.get(opts, :transport, Mysqlex.Tcp)
    host = opts |> Keyword.fetch!(:hostname) |> to_charlist()
    port = Keyword.get(opts, :port, @default_port)
    timeout = Keyword.get(opts, :connect_timeout, @default_timeout)
    socket_opts = Keyword.get(opts, :socket_options, [])

    with {:ok, socket} <- transport.connect(host, port, socket_opts, timeout) do
      handshake(transport, socket, opts)
    end
  end

  @doc """
  Runs the connection phase over an already-open socket.

  The server speaks first, so this reads before it writes: greeting, response,
  then however the server answers. Separate from `connect/1` so the conversation
  can be driven by a scripted transport.
  """
  def handshake(transport, socket, opts) do
    timeout = Keyword.get(opts, :connect_timeout, @default_timeout)
    username = Keyword.fetch!(opts, :username)
    password = Keyword.get(opts, :password)
    database = Keyword.get(opts, :database)

    client = %__MODULE__{
      transport: transport,
      socket: socket,
      capabilities: HandshakeResponse.capabilities(database)
    }

    with {:ok, sequence_id, greeting, buffer} <- recv_message(transport, socket, "", timeout),
         {:ok, handshake} <- Handshake.decode(greeting),
         response =
           HandshakeResponse.encode(
             username,
             NativePassword.reply(password, handshake.auth_plugin_data),
             database
           ),
         :ok <- send_message(transport, socket, response, sequence_id + 1),
         {:ok, buffer} <- authenticate(client, password, buffer, timeout) do
      {:ok,
       %{
         client
         | connection_id: handshake.connection_id,
           server_version: handshake.server_version,
           buffer: buffer
       }}
    end
  end

  @doc """
  Runs a statement and reads the server's answer.

  Every command starts a fresh sequence, so this writes as sequence id 0 and
  expects the reply as 1.
  """
  def query(%__MODULE__{} = client, statement, timeout \\ @default_timeout) do
    with :ok <- send_message(client.transport, client.socket, [0x03, statement], 0),
         {:ok, _sequence_id, payload, buffer} <-
           recv_message(client.transport, client.socket, client.buffer, timeout) do
      query_response(payload, %{client | buffer: buffer})
    end
  end

  # The first byte of a COM_QUERY response decides everything: 0x00 is an OK for
  # a statement that returned no rows, 0xFF an error, 0xFB the server asking the
  # client to upload a file, and anything else is a length-encoded column count
  # introducing a resultset.
  defp query_response(<<0x00, _rest::binary>> = payload, client) do
    {:ok, ok} = Ok.decode(payload, client.capabilities)

    {:ok, ok, client}
  end

  defp query_response(<<0xFF, _rest::binary>> = payload, client) do
    {:ok, error} = Err.decode(payload, client.capabilities)

    {:error, error, client}
  end

  # CLIENT_LOCAL_FILES is not claimed, so a server asking for a file is either
  # misbehaving or hostile. Refuse rather than read from the filesystem.
  defp query_response(<<0xFB, _rest::binary>>, client),
    do: {:error, :local_infile_not_supported, client}

  defp query_response(_payload, client), do: {:error, :resultset_not_implemented, client}

  @doc """
  Reads one message, reading again for as long as the buffer holds less than a
  whole message.

  `buffer` carries over whatever a previous read left unconsumed, and the
  returned `rest` is what this read left behind.
  """
  def recv_message(transport, socket, buffer, timeout) do
    case Packet.decode_message(buffer) do
      {:ok, sequence_id, message, rest} ->
        {:ok, sequence_id, message, rest}

      :more ->
        case transport.recv(socket, 0, timeout) do
          {:ok, data} -> recv_message(transport, socket, buffer <> data, timeout)
          {:error, reason} -> {:error, reason}
        end
    end
  end

  @doc """
  Frames a payload and writes it to the socket.
  """
  def send_message(transport, socket, payload, sequence_id) do
    payload
    |> IO.iodata_to_binary()
    |> Packet.encode(sequence_id)
    |> then(&transport.send(socket, &1))
  end

  # The greeting names the server's default authentication plugin, chosen before
  # it knows which account is connecting. When the account uses a different one
  # the server answers with an AuthSwitchRequest naming what it actually wants,
  # with a fresh scramble. So the plugin in the greeting is not something to
  # refuse on — switching is how the protocol settles the mismatch.
  defp authenticate(%__MODULE__{} = client, password, buffer, timeout) do
    with {:ok, sequence_id, payload, buffer} <-
           recv_message(client.transport, client.socket, buffer, timeout) do
      case payload do
        <<0x00, _rest::binary>> ->
          {:ok, buffer}

        <<0xFF, _rest::binary>> ->
          {:ok, error} = Err.decode(payload, client.capabilities)
          {:error, error}

        <<0xFE, rest::binary>> ->
          {plugin, data} = Codec.decode_string_nul(rest)
          switch_auth(client, plugin, data, password, buffer, sequence_id, timeout)
      end
    end
  end

  defp switch_auth(client, "mysql_native_password", data, password, buffer, sequence_id, timeout)
       when byte_size(data) >= 20 do
    # the fresh scramble is 20 bytes and a terminator, as in the greeting
    reply = NativePassword.reply(password, :binary.part(data, 0, 20))

    with :ok <- send_message(client.transport, client.socket, reply, sequence_id + 1) do
      authenticate(client, password, buffer, timeout)
    end
  end

  defp switch_auth(_client, plugin, _data, _password, _buffer, _sequence_id, _timeout),
    do: {:error, {:unsupported_auth_plugin, plugin}}
end
