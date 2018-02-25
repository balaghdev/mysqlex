defmodule Mysqlex.Protocol do
  use DBConnection

  defstruct host: nil, socket: nil, username: nil, database: nil, port: nil, timeout: nil

  @doc """
   DBConnection callback for `Mysqlex.startlink/3`
  """
  def connect(opts) do
    host = Keyword.fetch!(opts, :hostname) |> String.to_charlist() || "localhost"
    username = Keyword.fetch!(opts, :username) |> String.to_charlist()
    database = Keyword.fetch!(opts, :database) |> String.to_charlist()
    port = Keyword.fetch!(opts, :port) || 3306
    socket_opts = Keyword.get(opts, :socket_options, [])
    timeout = Keyword.get(opts, :connect_timeout, 5_000)

    state = %__MODULE__{
      host: host,
      username: username,
      database: database,
      port: port,
      timeout: timeout
    }

    case apply(Mysqlex.Tcp, :connect, [host, port, socket_opts, timeout]) do
      {:ok, socket} ->
        state = %{state | socket: socket}
        {data} = handshake(socket, state)

      {:error, _} = error ->
        error
    end

    IO.inspect(state)
  end

  def checkout(state) do
    {:ok, state}
  end

  defp handshake(socket, state) do
    {payload_length, sequence_id} = parse_header(socket)
    payload_body(socket, payload_length)
  end


  # Parsing of Initial handshake 
  defp parse_header(socket) do
    {:ok, header} = recv_msg(socket, 4)
    <<payload_length::little-integer-size(24), sequence_id::little-integer-size(8)>> = header
    {payload_length, sequence_id}
  end

  defp parse_payload_body(payload_length, socket) do
    {ok, body} = recv_msg(socket, payload_length)

    <<version::little-integer-size(8), server_version::little-binary-size(6), 0,
      connection_id::little-integer-size(32), auth_plugin_data_part_1::little-binary-size(8),
      filler::little-integer-size(8), capability_flags_lower::little-integer-size(16),
      character_set::little-integer-size(8), status_flags::little-integer-size(16),
      capability_flags_upper::little-integer-size(16),
      auth_plugin_data_len::little-integer-size(8), reserved::little-binary-size(10),
      auth_plugin_data_part_2::little-binary-size(13),
      auth_plugin_name::binary>> = body

    [auth_plugin_name, _] = String.split(auth_plugin_name, <<0>>)

    {version, server_version, connection_id, auth_plugin_data_part_1, capability_flags_lower,
     character_set, status_flags, capability_flags_upper, auth_plugin_data_len,auth_plugin_data, auth_plugin_name}
  end



  # Helper function
  defp recv_msg(socket, bytes) do
    case apply(Mysqlex.Tcp, :recv, [socket, bytes]) do
      {:ok, data} -> {:ok, data}
      {:error, _} -> :error
    end
  end
end
