# COM_PING

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_ping.html>

Check if the server is alive

| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x0E: COM_PING | 

Returns
    [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)

See also
    mysql_ping, dispatch_command
