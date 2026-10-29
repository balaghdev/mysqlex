defmodule Mysqlex.Protocol.CodecTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  alias Mysqlex.Protocol.Codec

  # One value either side of every size boundary in the spec's table.
  @int_lenenc [
    {0, <<0>>},
    {250, <<250>>},
    {251, <<0xFC, 251::little-16>>},
    {0xFFFF, <<0xFC, 0xFFFF::little-16>>},
    {0x10000, <<0xFD, 0x10000::little-24>>},
    {0xFFFFFF, <<0xFD, 0xFFFFFF::little-24>>},
    {0x1000000, <<0xFE, 0x1000000::little-64>>},
    {0xFFFFFFFFFFFFFFFF, <<0xFE, 0xFFFFFFFFFFFFFFFF::little-64>>}
  ]

  describe "int<lenenc>" do
    test "encodes each size boundary" do
      for {value, encoded} <- @int_lenenc do
        assert Codec.encode_int_lenenc(value) == encoded,
               "#{value} should encode to #{inspect(encoded, base: :hex)}"
      end
    end

    test "decodes each size boundary" do
      for {value, encoded} <- @int_lenenc do
        assert {^value, ""} = Codec.decode_int_lenenc(encoded)
      end
    end

    test "leaves the bytes after the integer" do
      assert {250, "rest"} = Codec.decode_int_lenenc(<<250, "rest">>)
      assert {0x10000, "rest"} = Codec.decode_int_lenenc(<<0xFD, 0x10000::little-24, "rest">>)
    end

    property "decoding inverts encoding" do
      check all(value <- integer(0..(2 ** 64 - 1))) do
        assert {^value, ""} = Codec.decode_int_lenenc(Codec.encode_int_lenenc(value))
      end
    end
  end
end
