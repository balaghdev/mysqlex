# Protocol::SSLRequest:

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_ssl_request.html>

SSL Connection Request Packet.

It is like [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) but is truncated right before username field. If server supports CLIENT_SSL capability, client can send this packet to request a secure SSL connection. The CLIENT_SSL capability flag must be set inside the SSL Connection Request Packet.

| Type | Name | Description |
| --- | --- | --- |
| if capabilities & CLIENT_PROTOCOL_41 { |  |  |
| int<4> | client_flag | Capabilities Flags |
| int<4> | max_packet_size | maximum packet size |
| int<1> | character_set | client charset a_protocol_character_set, only the lower 8-bits |
| string[23] | filler | filler to the size of the handhshake response packet. All 0s. |
| } else { |  |  |
| int<2> | client_flag | Capabilities Flags, only the lower 16 bits |
| int<3> | max_packet_size | maximum packet size, 0xFFFFFF max |
| } |  |  | 

See also
    int2store(), int3store(), int4store(), mysql_fill_packet_header()
