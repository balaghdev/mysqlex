# Protocol::HandshakeV10

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_v10.html>

Initial handshake packet for protocol version 10.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | protocol version | Always 10 |
| string<NUL> | server version | human readable status information |
| int<4> | thread id | a.k.a. connection id |
| string[8] | auth-plugin-data-part-1 | first 8 bytes of the plugin provided data (scramble) |
| int<1> | filler | 0x00 byte, terminating the first part of a scramble |
| int<2> | capability_flags_1 | The lower 2 bytes of the Capabilities Flags |
| int<1> | character_set | default server a_protocol_character_set, only the lower 8-bits |
| int<2> | status_flags | SERVER_STATUS_flags_enum |
| int<2> | capability_flags_2 | The upper 2 bytes of the Capabilities Flags |
| if capabilities & CLIENT_PLUGIN_AUTH { |  |  |
| int<1> | auth_plugin_data_len | length of the combined auth_plugin_data (scramble), if auth_plugin_data_len is > 0 |
| } else { |  |  |
| int<1> | 00 | constant 0x00 |
| } |  |  |
| string[10] | reserved | reserved. All 0s. |
| $length | auth-plugin-data-part-2 | Rest of the plugin provided data (scramble), $len=MAX(13, length of auth-plugin-data - 8) |
| if capabilities & CLIENT_PLUGIN_AUTH { |  |  |
| NULL | auth_plugin_name | name of the auth_method that the auth_plugin_data belongs to |
| } |  |  | 

If the client supports SSL ([Capabilities Flags](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html) & CLIENT_SSL is on and the [mysql_ssl_mode](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql_8h.html#ae246c1906ffb10491c3876ce39bb1d7b) of the client is not SSL_MODE_DISABLED) a short package called [Protocol::SSLRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_ssl_request.html) is sent, causing the server to establish an SSL layer and wait for the next package from the client.

Client then returns [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)

At any time, at any error, the client will just disconnect.

See also
    send_server_handshake_packet mysql_real_connect
