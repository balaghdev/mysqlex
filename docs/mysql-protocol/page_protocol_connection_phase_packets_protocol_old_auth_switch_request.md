# Protocol::OldAuthSwitchRequest:

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_old_auth_switch_request.html>

Warning
     _Deprecated_. Newer servers should never send this since they don't support [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) and they support [CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012). Newer clients should not support it since they should not support [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication). and they should support [CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012).

Old Authentication Method Switch Request Packet consisting of a single 0xfe byte. It is sent by server to request client to switch to [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) if [CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) capability flag is not supported (by either the client or the server).

| Type | Name | Description |
| --- | --- | --- |
| int<1> | 0xFE (254) | status tag | 

Returns
    [Protocol::AuthSwitchResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_response.html) with an [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) hash or closing the connection.

See also
    client_mpvio_read_packet()
