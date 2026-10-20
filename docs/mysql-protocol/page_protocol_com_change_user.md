# COM_CHANGE_USER

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_change_user.html>

Changes the user of the current connection.

Also and resets the following connection state:

  * user variables
  * temporary tables
  * prepared statements
  * ... and others

It is going through the same states as the [Initial Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html#sect_protocol_connection_phase_initial_handshake)

Returns
    [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) or [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)
| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x11: COM_CHANGE_USER |
| string<NUL> | user | user name |
| if capabilities & CLIENT_SECURE_CONNECTION { |  |  |
| int<1> | auth_plugin_data_len | length of auth_response |
| $length | auth_plugin_data | authentication data |
| } else { |  |  |
| string<NUL> | auth_plugin_data | authentication data (9 bytes) |
| } |  |  |
| string<NUL> | database | schema name |
| if more data available { |  |  |
| if capabilities & CLIENT_PROTOCOL_41 { |  |  |
| int<2> | character_set | new connection character set. See Character Set |
| } – CLIENT_PROTOCOL_41 |  |  |
| if capabilities & CLIENT_PLUGIN_AUTH { |  |  |
| string<NUL> | auth_plugin_name | client authentication plugin name used to generate auth_plugin_data |
| } – CLIENT_PLUGIN_AUTH |  |  |
| if capabilities & CLIENT_CONNECT_ATTRS { |  |  |
| int<lenenc> | connection_attributes_length | length in bytes of the following block of key-value pairs |
| $length | key | Key name |
| $length | value | value of key |
| more key/value pairs until connection_attributes_length is depleted |  |  |
| } – CLIENT_CONNECT_ATTRS |  |  |
| } – more data available |  |  | 

Please also read [Authentication After COM_CHANGE_USER Command](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html#sect_protocol_connection_phase_com_change_user_auth)

See also
    mysql_change_user, send_change_user_packet, parse_com_change_user_packet, acl_authenticate, dispatch_command
