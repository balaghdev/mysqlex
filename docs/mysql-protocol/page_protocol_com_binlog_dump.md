# COM_BINLOG_DUMP

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_binlog_dump.html>

Request a [Binlog Network Stream](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html#sect_protocol_replication_binlog_stream) from the server

Returns
    [Binlog Network Stream](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html#sect_protocol_replication_binlog_stream) on success or [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) on error
| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | [0x12] COM_BINLOG_DUMP |
| int<4> | binlog-pos | position in the binlog-file to start the stream with |
| int<2> | flags | can right now has one possible value: BINLOG_DUMP_NON_BLOCK |
| int<4> | server-id | Server id of this slave |
| string<EOF> | binlog-filename | filename of the binlog on the master | 

See also
    com_binlog_dump
