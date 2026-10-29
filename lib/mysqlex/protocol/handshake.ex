defmodule Mysqlex.Protocol.Handshake do
  @moduledoc """
  `Protocol::HandshakeV10`, the greeting the server sends on connect.

  MySQL speaks first, so this is the first packet any client sees and the one
  that decides everything after it: which capabilities are on offer, and which
  authentication method the server wants.

  See `docs/mysql-protocol/page_protocol_connection_phase_packets_protocol_handshake_v10.md`.
  """

  import Bitwise

  alias Mysqlex.Protocol.Codec

  defstruct [
    :protocol_version,
    :server_version,
    :connection_id,
    :capabilities,
    :character_set,
    :status_flags,
    :auth_plugin_name,
    :auth_plugin_data
  ]

  @doc """
  Decodes a HandshakeV10 payload.

  Two fields are easy to get wrong and both are sized by the protocol rather
  than fixed. `server_version` is NUL-terminated, not a fixed width — it is
  "8.4.4" on one server and "8.0.33-0ubuntu0.22.04.2" on another. The scramble
  arrives in two pieces with unrelated fields between them, and the second piece
  is `MAX(13, auth_plugin_data_len - 8)` bytes of which the last is a
  terminator, so the scramble itself is `auth_plugin_data_len - 1` bytes.
  """
  def decode(<<10, rest::binary>>) do
    {server_version, rest} = Codec.decode_string_nul(rest)

    <<connection_id::little-32, scramble_head::binary-size(8), 0, capabilities_lower::little-16,
      character_set, status_flags::little-16, capabilities_upper::little-16, auth_plugin_data_len,
      _reserved::binary-size(10), rest::binary>> = rest

    tail_length = max(13, auth_plugin_data_len - 8)
    <<scramble_tail::binary-size(^tail_length), rest::binary>> = rest
    {auth_plugin_name, _rest} = Codec.decode_string_nul(rest)

    scramble_length = auth_plugin_data_len - 1

    <<auth_plugin_data::binary-size(^scramble_length), _terminator::binary>> =
      scramble_head <> scramble_tail

    {:ok,
     %__MODULE__{
       protocol_version: 10,
       server_version: server_version,
       connection_id: connection_id,
       # the server splits its capability bitmask across two fields, nine bytes apart
       capabilities: capabilities_upper <<< 16 ||| capabilities_lower,
       character_set: character_set,
       status_flags: status_flags,
       auth_plugin_name: auth_plugin_name,
       auth_plugin_data: auth_plugin_data
     }}
  end
end
