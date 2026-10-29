defmodule Mysqlex.Protocol.HandshakeResponseTest do
  use ExUnit.Case, async: true

  import Bitwise

  alias Mysqlex.Protocol.HandshakeResponse

  @auth_response Base.decode16!("EC75977987F3398D9333EF89DE2A34C5BDED7CA7")

  test "claims only the capabilities the driver implements" do
    caps = HandshakeResponse.capabilities(nil)

    assert band(caps, 0x0200) != 0, "CLIENT_PROTOCOL_41"
    assert band(caps, 0x8000) != 0, "CLIENT_SECURE_CONNECTION"
    assert band(caps, 0x2000) != 0, "CLIENT_TRANSACTIONS"
    assert band(caps, 1 <<< 19) != 0, "CLIENT_PLUGIN_AUTH"

    refute band(caps, 0x0080) != 0, "CLIENT_LOCAL_FILES must stay off"
    refute band(caps, 1 <<< 16) != 0, "CLIENT_MULTI_STATEMENTS must stay off"
    refute band(caps, 1 <<< 23) != 0, "CLIENT_SESSION_TRACK is not parsed"
    refute band(caps, 1 <<< 24) != 0, "CLIENT_DEPRECATE_EOF is a phase 3 decision"
    refute band(caps, 0x0008) != 0, "CLIENT_CONNECT_WITH_DB without a database"
  end

  test "announces a database only when one is given" do
    assert band(HandshakeResponse.capabilities("mysqlex_test"), 0x0008) != 0
  end

  test "builds the packet the server expects" do
    payload =
      HandshakeResponse.encode("mysqlex", @auth_response, "mysqlex_test")
      |> IO.iodata_to_binary()

    capabilities = HandshakeResponse.capabilities("mysqlex_test")

    assert payload ==
             <<capabilities::little-32, 0xFFFFFF::little-32, 45, 0::size(23)-unit(8), "mysqlex",
               0, 20, @auth_response::binary, "mysqlex_test", 0, "mysql_native_password", 0>>
  end

  test "omits the database when there is none" do
    payload =
      HandshakeResponse.encode("mysqlex", @auth_response, nil)
      |> IO.iodata_to_binary()

    capabilities = HandshakeResponse.capabilities(nil)

    assert payload ==
             <<capabilities::little-32, 0xFFFFFF::little-32, 45, 0::size(23)-unit(8), "mysqlex",
               0, 20, @auth_response::binary, "mysql_native_password", 0>>
  end
end
