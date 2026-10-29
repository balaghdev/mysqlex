defmodule Mysqlex.Protocol.HandshakeResponse do
  @moduledoc """
  `Protocol::HandshakeResponse41` — the client's answer to the server's greeting,
  and the first packet this driver ever sends.

  The capability flags here are a claim rather than a question. Whatever is set
  decides the shape of nearly every packet that follows, which is why
  `capabilities/1` is public: the same value has to be handed to the response
  parsers so they read the right fields.

  See
  `docs/mysql-protocol/page_protocol_connection_phase_packets_protocol_handshake_response.md`.
  """

  import Bitwise

  alias Mysqlex.Protocol.Codec

  @connect_with_db 1 <<< 3
  @protocol_41 1 <<< 9
  @transactions 1 <<< 13
  # named CLIENT_RESERVED2 in current docs; modern servers behave as if it is
  # always set, older ones require it for 4.1-style authentication
  @secure_connection 1 <<< 15
  @plugin_auth 1 <<< 19

  @capabilities @protocol_41 ||| @transactions ||| @secure_connection ||| @plugin_auth

  # Deliberately not claimed:
  #   CLIENT_LOCAL_FILES      a malicious server can ask the client for any file
  #   CLIENT_MULTI_STATEMENTS turns one injected query into several
  #   CLIENT_SESSION_TRACK    changes the OK packet's shape; not parsed yet
  #   CLIENT_DEPRECATE_EOF    changes how resultsets terminate; a phase 3 call
  #   CLIENT_CONNECT_ATTRS    sends client metadata the driver has no use for

  # utf8mb4_general_ci, understood by every server since 5.5
  @character_set 45
  @max_packet_size 0xFFFFFF
  @auth_plugin_name "mysql_native_password"

  @doc """
  The capability flags the driver claims, which depend only on whether a
  database is being selected on connect.
  """
  def capabilities(nil), do: @capabilities
  def capabilities(_database), do: @capabilities ||| @connect_with_db

  @doc """
  Builds the response payload as iodata.

  `auth_response` is the output of the authentication method — for
  `mysql_native_password` that is `Mysqlex.Auth.NativePassword.reply/2`. It is
  length-prefixed with a single byte, which is the form used when
  `CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA` is not claimed.
  """
  def encode(username, auth_response, database) do
    [
      <<capabilities(database)::little-32, @max_packet_size::little-32, @character_set,
        0::size(23)-unit(8)>>,
      Codec.encode_string_nul(username),
      <<byte_size(auth_response)>>,
      auth_response,
      database_field(database),
      Codec.encode_string_nul(@auth_plugin_name)
    ]
  end

  defp database_field(nil), do: []
  defp database_field(database), do: Codec.encode_string_nul(database)
end
