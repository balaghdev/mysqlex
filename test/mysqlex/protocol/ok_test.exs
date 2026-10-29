defmodule Mysqlex.Protocol.OkTest do
  use ExUnit.Case, async: true

  alias Mysqlex.Protocol.Ok

  # CLIENT_PROTOCOL_41
  @protocol_41 0x0200

  test "decodes the example from the protocol documentation" do
    payload = <<0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00>>

    assert {:ok, ok} = Ok.decode(payload, @protocol_41)
    assert ok.affected_rows == 0
    assert ok.last_insert_id == 0
    assert ok.status_flags == 0x0002
    assert ok.warnings == 0
    assert ok.info == ""
  end

  test "reads affected rows and the last insert id" do
    payload = <<0x00, 1, 42, 0x02, 0x00, 0x00, 0x00>>

    assert {:ok, ok} = Ok.decode(payload, @protocol_41)
    assert ok.affected_rows == 1
    assert ok.last_insert_id == 42
  end

  test "reads the trailing info string" do
    payload = <<0x00, 1, 0, 0x02, 0x00, 0x00, 0x00, "Rows matched: 1  Changed: 1">>

    assert {:ok, ok} = Ok.decode(payload, @protocol_41)
    assert ok.info == "Rows matched: 1  Changed: 1"
  end
end
