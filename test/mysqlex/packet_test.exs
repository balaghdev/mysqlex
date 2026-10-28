defmodule Mysqlex.PacketTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

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
    assert IO.iodata_to_binary(Packet.encode("hello", 0)) == <<5::little-24, 0, "hello">>
  end

  property "decode/1 inverts encode/2" do
    check all(payload <- binary(), sequence_id <- integer(0..255)) do
      encoded = IO.iodata_to_binary(Packet.encode(payload, sequence_id))

      assert {:ok, ^sequence_id, ^payload, ""} = Packet.decode(encoded)
    end
  end

  describe "payloads at or beyond the maximum frame size" do
    @max_payload 0xFFFFFF

    test "encode/2 splits into continuation frames" do
      head = :binary.copy(<<0>>, @max_payload)

      assert IO.iodata_to_binary(Packet.encode(head <> "tail", 0)) ==
               <<@max_payload::little-24, 0>> <> head <> <<4::little-24, 1, "tail">>
    end

    test "encode/2 appends an empty frame when the payload is exactly the maximum" do
      payload = :binary.copy(<<0>>, @max_payload)

      assert IO.iodata_to_binary(Packet.encode(payload, 0)) ==
               <<@max_payload::little-24, 0>> <> payload <> <<0::little-24, 1>>
    end
  end
end
