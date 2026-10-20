# Protocol::HandshakeV9:

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_v9.html>

Initial handshake packet for protocol version 9.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | protocol version | Always 9 |
| string<NUL> | server version | human readable status information |
| int<4> | thread id | a.k.a. connection id |
| string<NUL> | scramble | Authentication plugin data for Old Password Authentication | 

Returns
    [Protocol::HandshakeResponse320](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html#sect_protocol_connection_phase_packets_protocol_handshake_response320)
