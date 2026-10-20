# Protocol::AuthSwitchRequest:

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html>

Authentication method Switch Request Packet

If both server and the client support [CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) capability, server can send this packet to ask client to use another authentication method.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | 0xFE (254) | status tag |
| string[NUL] | plugin name | name of the client authentication plugin to switch to |
| string[EOF] | plugin provided data | Initial authentication data for that client plugin | 

Returns
    [Protocol::AuthSwitchResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_response.html) or closing the connection.

See also
    send_plugin_request_packet(), client_mpvio_read_packet()
