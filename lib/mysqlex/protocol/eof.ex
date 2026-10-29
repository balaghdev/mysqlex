defmodule Mysqlex.Protocol.Eof do
  @moduledoc """
  The EOF_Packet, which marks the end of a resultset.

  Deprecated since MySQL 5.7.5 in favour of an OK packet standing in for it, so
  a client advertising `CLIENT_DEPRECATE_EOF` will not receive one. It is still
  needed for servers and connections that do not use that capability.

  Note the field order: `warnings` comes before `status_flags`, the reverse of
  the OK packet, which carries the same two values the other way round.

  The spec also warns that this packet can appear where a length-encoded integer
  can appear — both start `0xFE` — and that a payload shorter than 9 bytes is
  what distinguishes it. That check needs the payload length, so it belongs to
  whatever dispatches on the payload rather than here.

  See `docs/mysql-protocol/page_protocol_basic_eof_packet.md`.
  """

  import Bitwise

  # CLIENT_PROTOCOL_41
  @protocol_41 0x0200

  defstruct warnings: 0, status_flags: 0

  @doc """
  Decodes an EOF_Packet payload.
  """
  def decode(<<0xFE, warnings::little-16, status_flags::little-16>>, capabilities)
      when (capabilities &&& @protocol_41) != 0 do
    {:ok, %__MODULE__{warnings: warnings, status_flags: status_flags}}
  end

  def decode(<<0xFE>>, _capabilities), do: {:ok, %__MODULE__{}}
end
