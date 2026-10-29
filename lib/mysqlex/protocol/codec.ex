defmodule Mysqlex.Protocol.Codec do
  @moduledoc """
  The protocol's own wire types — the grammar every packet body is built from.

  See `docs/mysql-protocol/page_protocol_basic_dt_integers.md` and
  `docs/mysql-protocol/page_protocol_basic_dt_strings.md`.
  """

  @doc """
  Encodes a length-encoded integer in the shortest form that holds it.

  The one-byte form stops at 250, not 251. `0xFB` marks a NULL column in a text
  resultset row and `0xFC` to `0xFE` are the prefixes for the longer forms, so
  those byte values cannot stand for themselves.
  """
  def encode_int_lenenc(value) when value < 251, do: <<value>>
  def encode_int_lenenc(value) when value < 0x10000, do: <<0xFC, value::little-16>>
  def encode_int_lenenc(value) when value < 0x1000000, do: <<0xFD, value::little-24>>
  def encode_int_lenenc(value), do: <<0xFE, value::little-64>>

  @doc """
  Decodes a length-encoded integer, returning it with the bytes that follow it.

  `0xFB` matches no clause: in the one place it appears it means NULL, and the
  row parser is responsible for recognising that before asking for an integer.
  """
  def decode_int_lenenc(<<0xFC, value::little-16, rest::binary>>), do: {value, rest}
  def decode_int_lenenc(<<0xFD, value::little-24, rest::binary>>), do: {value, rest}
  def decode_int_lenenc(<<0xFE, value::little-64, rest::binary>>), do: {value, rest}
  def decode_int_lenenc(<<value, rest::binary>>) when value < 251, do: {value, rest}
end
