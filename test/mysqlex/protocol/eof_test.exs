defmodule Mysqlex.Protocol.EofTest do
  use ExUnit.Case, async: true

  alias Mysqlex.Protocol.Eof

  # CLIENT_PROTOCOL_41
  @protocol_41 0x0200

  test "decodes the example from the protocol documentation" do
    payload = <<0xFE, 0x00, 0x00, 0x02, 0x00>>

    assert {:ok, eof} = Eof.decode(payload, @protocol_41)
    assert eof.warnings == 0
    assert eof.status_flags == 0x0002
  end

  test "reads warnings before status flags, the reverse of the OK packet" do
    payload = <<0xFE, 3, 0, 2, 0>>

    assert {:ok, eof} = Eof.decode(payload, @protocol_41)
    assert eof.warnings == 3
    assert eof.status_flags == 2
  end

  test "carries neither field when CLIENT_PROTOCOL_41 was not negotiated" do
    assert {:ok, eof} = Eof.decode(<<0xFE>>, 0)
    assert eof.warnings == 0
    assert eof.status_flags == 0
  end
end
