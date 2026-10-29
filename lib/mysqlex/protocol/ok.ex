defmodule Mysqlex.Protocol.Ok do
  @moduledoc """
  The OK_Packet, which the server sends when a command completes successfully.

  Since 5.7.5 it also stands in for the EOF packet, which is why the header is
  `0x00` or `0xFE`. The two are told apart by length rather than by header — OK
  is `0x00` with a payload of 7 bytes or more, EOF is `0xFE` with fewer than 8 —
  and that decision belongs to whatever dispatches on the payload, since only it
  knows the length.

  See `docs/mysql-protocol/page_protocol_basic_ok_packet.md`.
  """

  import Bitwise

  alias Mysqlex.Protocol.Codec

  # CLIENT_PROTOCOL_41, CLIENT_TRANSACTIONS
  @protocol_41 0x0200
  @transactions 0x2000

  defstruct affected_rows: 0, last_insert_id: 0, status_flags: 0, warnings: 0, info: ""

  @doc """
  Decodes an OK_Packet payload.

  `CLIENT_SESSION_TRACK` is not handled: with that capability `info` becomes a
  length-encoded string followed by an optional session-state block, a different
  shape entirely. The driver does not advertise the capability, so the server
  does not send it.
  """
  def decode(<<header, rest::binary>>, capabilities) when header in [0x00, 0xFE] do
    {affected_rows, rest} = Codec.decode_int_lenenc(rest)
    {last_insert_id, rest} = Codec.decode_int_lenenc(rest)
    {status_flags, warnings, info} = decode_status(rest, capabilities)

    {:ok,
     %__MODULE__{
       affected_rows: affected_rows,
       last_insert_id: last_insert_id,
       status_flags: status_flags,
       warnings: warnings,
       info: info
     }}
  end

  defp decode_status(<<status_flags::little-16, warnings::little-16, info::binary>>, capabilities)
       when (capabilities &&& @protocol_41) != 0,
       do: {status_flags, warnings, info}

  defp decode_status(<<status_flags::little-16, info::binary>>, capabilities)
       when (capabilities &&& @transactions) != 0,
       do: {status_flags, 0, info}

  defp decode_status(info, _capabilities), do: {0, 0, info}
end
