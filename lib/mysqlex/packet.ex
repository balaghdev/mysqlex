defmodule Mysqlex.Packet do
  @moduledoc """
  Packet framing.

  Every MySQL packet is a 3-byte little-endian payload length, a 1-byte
  sequence id, and the payload itself. See
  `docs/mysql-protocol/page_protocol_basic_packets.md`.
  """

  @max_payload 0xFFFFFF

  @doc """
  Decodes one packet from the front of `data`.

  Returns `{:ok, sequence_id, payload, rest}`, or `:more` when `data` does not
  hold a whole packet yet.
  """
  def decode(<<len::little-24, sequence_id, payload::binary-size(len), rest::binary>>),
    do: {:ok, sequence_id, payload, rest}

  def decode(_data), do: :more

  @doc """
  Decodes one logical message, rejoining any continuation frames.

  A frame carrying exactly #{@max_payload} bytes means another frame follows, so
  frames are collected until a shorter one ends the message. Returns
  `{:ok, sequence_id, message, rest}` with the sequence id of the final frame —
  the next frame the connection expects is that id plus one — or `:more` while
  any frame of the message is still outstanding.
  """
  def decode_message(data), do: decode_message(data, [])

  defp decode_message(data, frames) do
    case decode(data) do
      {:ok, _sequence_id, payload, rest} when byte_size(payload) == @max_payload ->
        decode_message(rest, [payload | frames])

      {:ok, sequence_id, payload, rest} ->
        {:ok, sequence_id, IO.iodata_to_binary(Enum.reverse([payload | frames])), rest}

      :more ->
        :more
    end
  end

  @doc """
  Encodes `payload` as a packet carrying `sequence_id`, returning iodata.

  A payload of #{@max_payload} bytes or more does not fit in the 3-byte length,
  so it is split across continuation frames with the sequence id incrementing
  per frame. A payload that is an exact multiple of the maximum is followed by
  an empty frame, which is how the reader knows the message ended.
  """
  def encode(payload, sequence_id) when byte_size(payload) >= @max_payload do
    <<frame::binary-size(@max_payload), rest::binary>> = payload

    [
      <<@max_payload::little-24, sequence_id>>,
      frame | encode(rest, rem(sequence_id + 1, 256))
    ]
  end

  def encode(payload, sequence_id) do
    [<<byte_size(payload)::little-24, sequence_id>>, payload]
  end
end
