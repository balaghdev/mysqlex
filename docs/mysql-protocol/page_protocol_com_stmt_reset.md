# COM_STMT_RESET

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_reset.html>

COM_STMT_RESET resets the data of a prepared statement which was accumulated with COM_STMT_SEND_LONG_DATA commands and closes the cursor if it was opened with COM_STMT_EXECUTE.

The server will send a [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) if the statement could be reset, a [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) if not.

Returns
    [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) or a [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)
| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | [0x1A] COM_STMT_RESET |
| int<4> | statement_id | ID of the prepared statement to reset | 

Example
    

05 00 00 00 1a 01 00 00 00 .........

See also
    mysql_stmt_reset, mysqld_stmt_reset, mysql_stmt_precheck
