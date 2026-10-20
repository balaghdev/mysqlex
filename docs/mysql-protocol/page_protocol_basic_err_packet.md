# ERR_Packet

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html>

This packet signals that an error occurred.

It contains a SQL state value if CLIENT_PROTOCOL_41 is enabled.

Error texts cannot exceed MYSQL_ERRMSG_SIZE

| Type | Name | Description |
| --- | --- | --- |
| int<1> | header | 0xFF ERR packet header |
| int<2> | error_code | error-code |
| if capabilities & CLIENT_PROTOCOL_41 { |  |  |
| string[1] | sql_state_marker | # marker of the SQL state |
| string[5] | sql_state | SQL state |
| } |  |  |
| string<EOF> | error_message | human readable error message | 

Example:

| 17 00 00 01 ff 48 04 23 48 59 30 30 30 4e 6f 20 74 61 62 6c 65 73 20 75 73 65 64 | .....H.#HY000No tables used |
| --- | --- | 

See also
    net_send_error_packet()
