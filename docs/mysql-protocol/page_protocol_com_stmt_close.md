# COM_STMT_CLOSE

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_close.html>

COM_STMT_CLOSE deallocates a prepared statement.

No response packet is sent back to the client.

Returns
    None
| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | [0x19] COM_STMT_CLOSE |
| int<4> | statement_id | ID of the prepared statement to close | 

Example
    

05 00 00 00 19 01 00 00 00 .........

See also
    mysql_stmt_close, mysql_stmt_prepare, mysqld_stmt_close, mysql_stmt_precheck
