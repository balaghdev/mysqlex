# EOF_Packet

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html>

If CLIENT_PROTOCOL_41 is enabled, the EOF packet contains a warning count and status flags.

Note
    In the MySQL client/server protocol, the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) and [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) packets serve the same purpose, to mark the end of a query execution result. Due to changes in MySQL 5.7 in the [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) packets (such as session state tracking), and to avoid repeating the changes in the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) packet, the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) is deprecated as of MySQL 5.7.5.

Warning
    The [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) packet may appear in places where a [Protocol::LengthEncodedInteger](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#sect_protocol_basic_dt_int_le) may appear. You must check whether the packet length is less than 9 to make sure that it is a [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) packet.
| Type | Name | Description |
| --- | --- | --- |
| int<1> | header | 0xFE EOF packet header |
| if capabilities & CLIENT_PROTOCOL_41 { |  |  |
| int<2> | warnings | number of warnings |
| int<2> | status_flags | SERVER_STATUS_flags_enum | 

Example:

A MySQL 4.1 EOF packet with: 0 warnings, AUTOCOMMIT enabled.

| 05 00 00 05 fe 00 00 02 00 | .......... |
| --- | --- | 

See also
    net_send_eof().
