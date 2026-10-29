defmodule Mysqlex.ClientLoginTest do
  use ExUnit.Case, async: true

  alias Mysqlex.Auth.NativePassword
  alias Mysqlex.{Client, Error, FakeTransport}
  alias Mysqlex.Packet
  alias Mysqlex.Protocol.HandshakeResponse

  @handshake File.read!("test/fixtures/handshake_v10_8.4.4.bin")
  # the same captured bytes with the plugin name swapped, since the server this
  # was taken from offers caching_sha2_password and MySQL 8.4 ships
  # mysql_native_password disabled
  @native_handshake String.replace(@handshake, "caching_sha2_password", "mysql_native_password")

  @scramble Base.decode16!("6344555B255D623B3A1E1147626D276F0F4F0B74")

  defp framed(payload, sequence_id), do: IO.iodata_to_binary(Packet.encode(payload, sequence_id))

  defp opts(socket) do
    [
      transport: FakeTransport,
      socket: socket,
      username: "mysqlex",
      password: "secret",
      database: "mysqlex_test"
    ]
  end

  test "completes a login and reports what the server said about itself" do
    ok = <<0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00>>
    socket = FakeTransport.script([framed(@native_handshake, 0), framed(ok, 2)])

    assert {:ok, client} = Client.handshake(FakeTransport, socket, opts(socket))

    assert client.connection_id == 78_814
    assert client.server_version == "8.4.4"
    assert client.capabilities == HandshakeResponse.capabilities("mysqlex_test")
  end

  test "answers the server's scramble with the right bytes, as sequence id 1" do
    ok = <<0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00>>
    socket = FakeTransport.script([framed(@native_handshake, 0), framed(ok, 2)])

    assert {:ok, _client} = Client.handshake(FakeTransport, socket, opts(socket))

    expected =
      "mysqlex"
      |> HandshakeResponse.encode(NativePassword.reply("secret", @scramble), "mysqlex_test")
      |> IO.iodata_to_binary()
      |> framed(1)

    assert FakeTransport.sent(socket) == expected
  end

  test "returns the server's error when the login is refused" do
    err = <<0xFF, 0x15, 0x04, ?#, "28000", "Access denied for user 'mysqlex'@'localhost'">>
    socket = FakeTransport.script([framed(@native_handshake, 0), framed(err, 2)])

    assert {:error, %Error{} = error} = Client.handshake(FakeTransport, socket, opts(socket))

    assert error.code == 1045
    assert error.sql_state == "28000"
    assert error.message =~ "Access denied"
  end

  test "refuses a plugin it cannot speak, rather than guessing" do
    socket = FakeTransport.script([framed(@handshake, 0)])

    assert {:error, {:unsupported_auth_plugin, "caching_sha2_password"}} =
             Client.handshake(FakeTransport, socket, opts(socket))
  end
end
