defmodule Mysqlex.Client do
  @moduledoc """
  Reads and writes packets over a `Mysqlex.Transport`.

  This is where the socket lives. Everything it hands upwards is a whole
  message, so no parser above it ever sees a partial read.
  """

  alias Mysqlex.Auth.NativePassword
  alias Mysqlex.Packet
  alias Mysqlex.Protocol.{Err, Handshake, HandshakeResponse, Ok}

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

  The server speaks first, so this reads before it writes: greeting, then the
  response, then whatever the server makes of it. Separate from `connect/1` so
  the conversation can be driven by a scripted transport.
  """
  def handshake(transport, socket, opts) do
    timeout = Keyword.get(opts, :connect_timeout, @default_timeout)
    username = Keyword.fetch!(opts, :username)
    password = Keyword.get(opts, :password) || ""
    database = Keyword.get(opts, :database)
    capabilities = HandshakeResponse.capabilities(database)

    with {:ok, sequence_id, greeting, buffer} <- recv_message(transport, socket, "", timeout),
         {:ok, handshake} <- Handshake.decode(greeting),
         :ok <- supported_plugin(handshake.auth_plugin_name),
         response =
           HandshakeResponse.encode(
             username,
             NativePassword.reply(password, handshake.auth_plugin_data),
             database
           ),
         :ok <- send_message(transport, socket, response, sequence_id + 1),
         {:ok, _sequence_id, reply, buffer} <-
           recv_message(transport, socket, buffer, timeout),
         {:ok, _ok} <- decode_login_reply(reply, capabilities) do
      {:ok,
       %__MODULE__{
         transport: transport,
         socket: socket,
         capabilities: capabilities,
         connection_id: handshake.connection_id,
         server_version: handshake.server_version,
         buffer: buffer
       }}
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

  # Only one method is implemented so far. Saying so beats sending a reply the
  # server will reject for reasons that look like a bad password.
  defp supported_plugin("mysql_native_password"), do: :ok
  defp supported_plugin(other), do: {:error, {:unsupported_auth_plugin, other}}

  defp decode_login_reply(<<0x00, _rest::binary>> = payload, capabilities),
    do: Ok.decode(payload, capabilities)

  defp decode_login_reply(<<0xFF, _rest::binary>> = payload, capabilities) do
    {:ok, error} = Err.decode(payload, capabilities)

    {:error, error}
  end

  defp decode_login_reply(<<0xFE, _rest::binary>>, _capabilities),
    do: {:error, :auth_switch_not_supported}

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
end
