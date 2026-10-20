# Protocol::Handshake

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html>

Initial Handshake Packet

When the client connects to the server the server sends a handshake packet to the client. Depending on the server version and configuration options different variants of the initial packet are sent.

To permit the server to add support for newer protocols, the first byte defines the protocol version.

Since 3.21.0 the [Protocol::HandshakeV10](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_v10.html) is sent.

[Protocol::HandshakeV9:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_v9.html) [Protocol::HandshakeV10](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_v10.html)
