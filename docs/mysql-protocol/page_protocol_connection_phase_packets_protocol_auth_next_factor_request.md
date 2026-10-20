# Protocol::AuthNextFactor:

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_next_factor_request.html>

Next Authentication method Packet in [Multi Factor Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_multi_factor_authentication_methods.html)

If both server and the client support [MULTI_FACTOR_AUTHENTICATION](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaadc8817bdbea290ab58e6b0ccd848906) capability, server can send this packet to ask client to initiate next authentication method in [Multi Factor Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_multi_factor_authentication_methods.html) process.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | 0x02 | packet type |
| string[NUL] | plugin name | name of the client authentication plugin |
| string[EOF] | plugin provided data | Initial authentication data for that client plugin | 

Returns
    [Protocol::AuthNextFactor:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_next_factor_request.html) or closing the connection.

See also
    send_auth_next_factor_packet(), client_mpvio_read_packet() [send_auth_next_factor_packet()](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__authentication_8cc.html#a37f320e5f897bbc52427d931c83c1302), client_mpvio_read_packet()
