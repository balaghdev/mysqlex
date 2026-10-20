# COM_STMT_SEND_LONG_DATA

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_send_long_data.html>

Sends the data for a parameter.

Repeating to send it, appends the data to the parameter.

No response is sent back to the client

Returns
    None
| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | [0x18] COM_STMT_SEND_LONG_DATA |
| int<4> | statement_id | ID of the statement |
| int<2> | param_id | The parameter to supply data to |
| binary<var> | data | The actual payload to send | 

Note
    COM_STMT_SEND_LONG_DATA has to be sent before COM_STMT_EXECUTE
