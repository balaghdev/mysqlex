defmodule Mysqlex.Packet do
  @moduledoc """
  Packet framing.

  Every MySQL packet is a 3-byte little-endian payload length, a 1-byte
  sequence id, and the payload itself. See
  `docs/mysql-protocol/page_protocol_basic_packets.md`.
  """

  @doc """
  Decodes one packet from the front of `data`.

  Returns `{:ok, sequence_id, payload, rest}`, or `:more` when `data` does not
  hold a whole packet yet.
  """
  def decode(<<len::little-24, sequence_id, payload::binary-size(len), rest::binary>>),
    do: {:ok, sequence_id, payload, rest}

  def decode(_data), do: :more

  @doc """
  Encodes `payload` as a packet carrying `sequence_id`.
  """
  def encode(payload, sequence_id) do
    <<byte_size(payload)::little-24, sequence_id, payload::binary>>
  end
end
