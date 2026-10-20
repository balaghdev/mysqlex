# COM_SET_OPTION

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_set_option.html>

Sets options for the current connection

COM_SET_OPTION enables and disables server capabilities for the current connection.

Note
    Only CLIENT_MULTI_STATEMENTS can be set to a value defined in enum_mysql_set_option.

Returns
    [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) on success, [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) otherwise.
| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | [0x1A] COM_SET_OPTION |
| int<2> | option_operation | One of enum_mysql_set_option | 

See also
    mysql_set_server_option, dispatch_sql_command
