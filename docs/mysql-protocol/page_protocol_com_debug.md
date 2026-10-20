# COM_DEBUG

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_debug.html>

Dump debug info to server's stdout

COM_DEBUG triggers a dump on internal debug info to stdout of the mysql-server.

The SUPER_ACL privilege is required for this operation.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x0D: COM_DEBUG | 

Returns
    [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) or [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)

See also
    mysql_dump_debug_info, dispatch_command
