defmodule Mysqlex.Protocol.HandshakeTest do
  use ExUnit.Case, async: true

  alias Mysqlex.Protocol.Handshake

  test "parses the handshake captured from MySQL 8.4.4" do
    payload = File.read!("test/fixtures/handshake_v10_8.4.4.bin")

    assert {:ok, handshake} = Handshake.decode(payload)

    assert handshake.protocol_version == 10
    assert handshake.server_version == "8.4.4"
    assert handshake.connection_id == 78_814
    assert handshake.character_set == 255
    assert handshake.status_flags == 0x0002
    assert handshake.capabilities == 0xDFFFFFFF
    assert handshake.auth_plugin_name == "caching_sha2_password"
  end

  test "joins the scramble that the server splits across two fields" do
    payload = File.read!("test/fixtures/handshake_v10_8.4.4.bin")

    assert {:ok, handshake} = Handshake.decode(payload)

    assert byte_size(handshake.auth_plugin_data) == 20

    assert Base.encode16(handshake.auth_plugin_data, case: :lower) ==
             "6344555b255d623b3a1e1147626d276f0f4f0b74"
  end
end
