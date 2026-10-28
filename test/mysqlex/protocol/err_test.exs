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
end
