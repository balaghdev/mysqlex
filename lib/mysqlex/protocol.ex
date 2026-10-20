defmodule Mysqlex.Protocol do
  @moduledoc """
  `DBConnection` callbacks implementing the MySQL client/server protocol.

  The protocol reference this is built against is vendored under
  `docs/mysql-protocol/`.

  Implemented so far: the connection phase up to reading the server's
  `Protocol::HandshakeV10` packet. The command phase callbacks return an error
  until that work lands.
  """

  use DBConnection

  require Logger

  alias Mysqlex.Tcp

  defstruct host: nil,
            socket: nil,
            username: nil,
            password: nil,
            database: nil,
            port: nil,
            timeout: nil,
            opts: nil

  @default_port 3306
  @default_timeout 5_000

  @doc """
  DBConnection callback for `Mysqlex.start_link/5`.
  """
  @impl true
  def connect(opts) do
    state = %__MODULE__{
      host: opts |> Keyword.fetch!(:hostname) |> to_charlist(),
      username: Keyword.fetch!(opts, :username),
      password: Keyword.get(opts, :password),
      database: Keyword.fetch!(opts, :database),
      port: Keyword.get(opts, :port, @default_port),
      timeout: Keyword.get(opts, :connect_timeout, @default_timeout),
      opts: opts
    }

    socket_opts = Keyword.get(opts, :socket_options, [])

    with {:ok, socket} <- Tcp.connect(state.host, state.port, socket_opts, state.timeout) do
      Logger.debug(fn -> "mysqlex: server handshake #{inspect(handshake(socket))}" end)
      {:ok, %{state | socket: socket}}
    end
  end

  @impl true
  def disconnect(_reason, %__MODULE__{socket: nil}), do: :ok

  def disconnect(_reason, %__MODULE__{socket: socket}) do
    Tcp.close(socket)
    :ok
  end

  @impl true
  def checkout(state), do: {:ok, state}

  @impl true
  def ping(state), do: {:ok, state}

  @impl true
  def handle_begin(_opts, state), do: {:error, state}

  @impl true
  def handle_commit(_opts, state), do: {:error, state}

  @impl true
  def handle_rollback(_opts, state), do: {:error, state}

  @impl true
  def handle_status(_opts, state), do: {:idle, state}

  @impl true
  def handle_prepare(_query, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_execute(_query, _params, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_close(_query, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_declare(_query, _params, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_fetch(_query, _cursor, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_deallocate(_query, _cursor, _opts, state), do: {:error, not_implemented(), state}

  defp not_implemented do
    DBConnection.ConnectionError.exception("Mysqlex does not implement the command phase yet")
  end

  defp handshake(socket) do
    {payload_length, _sequence_id} = parse_header(socket)
    parse_payload_body(socket, payload_length)
  end

  # Parsing of Initial handshake
  defp parse_header(socket) do
    {:ok, header} = recv_msg(socket, 4)
    <<payload_length::little-integer-size(24), sequence_id::little-integer-size(8)>> = header
    {payload_length, sequence_id}
  end

  defp parse_payload_body(socket, payload_length) do
    {:ok, body} = recv_msg(socket, payload_length)

    <<version::little-integer-size(8), server_version::little-binary-size(6), 0,
      connection_id::little-integer-size(32), auth_plugin_data_part_1::little-binary-size(8),
      _filler::little-integer-size(8), capability_flags_lower::little-integer-size(16),
      character_set::little-integer-size(8), status_flags::little-integer-size(16),
      capability_flags_upper::little-integer-size(16),
      auth_plugin_data_len::little-integer-size(8), _reserved::little-binary-size(10),
      auth_plugin_data_part_2::little-binary-size(13), auth_plugin_name::binary>> = body

    [auth_plugin_name, _] = String.split(auth_plugin_name, <<0>>)

    {version, server_version, connection_id, auth_plugin_data_part_1, capability_flags_lower,
     character_set, status_flags, capability_flags_upper, auth_plugin_data_len,
     auth_plugin_data_part_2, auth_plugin_name}
  end

  # Helper function
  defp recv_msg(socket, bytes) do
    case Tcp.recv(socket, bytes) do
      {:ok, data} -> {:ok, data}
      {:error, _reason} = error -> error
    end
  end
end
