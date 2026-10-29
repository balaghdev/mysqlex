defmodule Mysqlex.Protocol.Err do
  @moduledoc """
  The ERR_Packet, which the server sends whenever something goes wrong.

  See `docs/mysql-protocol/page_protocol_basic_err_packet.md`.
  """

  import Bitwise

  alias Mysqlex.Error

  # CLIENT_PROTOCOL_41
  @protocol_41 0x0200

  @doc """
  Decodes an ERR_Packet payload.

  The SQL state is only sent when `CLIENT_PROTOCOL_41` was negotiated, so the
  capability flags decide how much of the packet there is to read. The message
  runs to the end of the payload and carries no length of its own.
  """
  def decode(<<0xFF, code::little-16, rest::binary>>, capabilities) do
    {sql_state, message} = split_sql_state(rest, (capabilities &&& @protocol_41) != 0)

    {:ok, %Error{code: code, sql_state: sql_state, message: message}}
  end

  defp split_sql_state(<<?#, sql_state::binary-size(5), message::binary>>, true),
    do: {sql_state, message}

  # The marker carries no information — it exists so that clients older than 4.1
  # could tell whether a SQL state was present. Treat its absence as the server
  # having sent none rather than as a malformed packet.
  defp split_sql_state(message, _protocol_41), do: {nil, message}
end
