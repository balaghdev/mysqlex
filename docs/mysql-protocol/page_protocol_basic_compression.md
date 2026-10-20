# Compression

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression.html>

Compression is:

  * its own protocol layer
  * transparent to the other MySQL protocol layers
  * compressing a string of bytes (which may even be a part of [Protocol::Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_packets.html#sect_protocol_basic_packets_packet))

It is enabled if:

  * the server announces CLIENT_COMPRESS or CLIENT_ZSTD_COMPRESSION_ALGORITHM in its [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) based on variable protocol_compression_algorithms and
  * the client does following:
    * if client flags match with server flags, then client announces the matching flag as part of [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) if matching flag is CLIENT_ZSTD_COMPRESSION_ALGORITHM then client sends extra 1 byte in [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)
    * if client flags do not match then connection fallsback to uncompressed mode.
  * Server finishes the [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html) with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html).

If both CLIENT_COMPRESS and CLIENT_ZSTD_COMPRESSION_ALGORITHM are set then zlib is used.

[Compressed Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_compression_packet.html)
