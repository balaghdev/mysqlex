defmodule Mysqlex.PacketTest do
  use ExUnit.Case, async: true

  alias Mysqlex.Packet

  test "decodes a packet into its sequence id and payload" do
    assert {:ok, 0, "hello", ""} = Packet.decode(<<5::little-24, 0, "hello">>)
  end

  test "returns :more when the payload has not fully arrived" do
    assert :more = Packet.decode(<<5::little-24, 0, "hel">>)
  end

  test "returns the bytes following the packet as rest" do
    second = <<3::little-24, 1, "bye">>

    assert {:ok, 0, "hello", ^second} = Packet.decode(<<5::little-24, 0, "hello">> <> second)
  end

  test "encodes a payload into a packet" do
    assert Packet.encode("hello", 0) == <<5::little-24, 0, "hello">>
  end
end
