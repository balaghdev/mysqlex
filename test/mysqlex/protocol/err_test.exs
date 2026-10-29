defmodule Mysqlex.Protocol.ErrTest do
  use ExUnit.Case, async: true

  alias Mysqlex.Protocol.Err

  # CLIENT_PROTOCOL_41
  @protocol_41 0x0200

  test "decodes the example from the protocol documentation" do
    payload = <<0xFF, 0x48, 0x04, ?#, "HY000", "No tables used">>

    assert {:ok, error} = Err.decode(payload, @protocol_41)
    assert error.code == 1096
    assert error.sql_state == "HY000"
    assert error.message == "No tables used"
  end

  test "reads no SQL state when CLIENT_PROTOCOL_41 was not negotiated" do
    payload = <<0xFF, 0x15, 0x04, "Access denied">>

    assert {:ok, error} = Err.decode(payload, 0)
    assert error.code == 1045
    assert error.sql_state == nil
    assert error.message == "Access denied"
  end

  test "tolerates a 4.1 packet that carries no SQL state marker" do
    payload = <<0xFF, 0x15, 0x04, "Access denied">>

    assert {:ok, error} = Err.decode(payload, @protocol_41)
    assert error.sql_state == nil
    assert error.message == "Access denied"
  end
end
