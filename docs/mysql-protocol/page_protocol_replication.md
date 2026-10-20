# Replication Protocol

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html>

Replication uses binlogs to ship changes done on the master to the slave and can be written to [Binlog File](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html#sect_protocol_replication_binlog_file) and sent over the network as [Binlog Network Stream](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html#sect_protocol_replication_binlog_stream).

#  Binlog File

Binlog files start with a [Binlog File Header](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html#sect_protocol_replication_binlog_file_header) followed by a series of [Binlog Event](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html)

##  Binlog File Header

A binlog file start with a 'Binlog File Header [ 0xFE 'bin']` 

$ [hexdump](https://dev.mysql.com/doc/dev/mysql-server/latest/xcom__cache_8cc.html#afe16fd8b6041439b9fb6ff68b38316de) -C /tmp/[binlog](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacebinlog.html)-test.log

00000000 fe 62 69 6e 19 6f c9 4c 0f 01 00 00 00 66 00 00 |.bin.o.L.....f..|

00000010 00 6a 00 00 00 00 00 04 00 6d 79 73 71 6c 2d 70 |.j.......mysql-[p](https://dev.mysql.com/doc/dev/mysql-server/latest/ctype-mb_8cc.html#a6bc6b007533335efe02bafff799ec64c)|

00000020 72 6f 78 79 2d 30 2e 37 2e 30 00 00 00 00 00 00 |roxy-0.7.0......|

...

[p](https://dev.mysql.com/doc/dev/mysql-server/latest/ctype-mb_8cc.html#a6bc6b007533335efe02bafff799ec64c)

const char * p

**Definition:** ctype-mb.cc:1227

[binlog](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacebinlog.html)

**Definition:** pfs.cc:38

[hexdump](https://dev.mysql.com/doc/dev/mysql-server/latest/xcom__cache_8cc.html#afe16fd8b6041439b9fb6ff68b38316de)

void hexdump(void *p, long length)

#  Binlog Network Stream

Network streams are requested with [COM_BINLOG_DUMP](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_binlog_dump.html) and prepend each [Binlog Event](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html) with `00` OK-byte.

#  Binlog Version

Depending on the MySQL version that created the binlog the format is slightly different. Four versions are currently known:

| Binlog version | MySQL Version |
| --- | --- |
| 1 | MySQL 3.23 - < 4.0.0 |
| 2 | MySQL 4.0.0 - 4.0.1 |
| 3 | MySQL 4.0.2 - < 5.0.0 |
| 4 | MySQL 5.0.0+ | 

##  Version 1

Supported [Statement Based Replication Events](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_binlog_event_sbr)

##  Version 2

Can be ignored as it was only used in early alpha versinos of MySQL 4.1 and won't be documented here.

##  Version 3

Added the relay logs and changed the meaning of the log position

##  Version 4

Added the [FORMAT_DESCRIPTION_EVENT](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_format_desc) and made the protocol extensible.

In MySQL 5.1.x the [Row Based Replication Events](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_binlog_event_rbr) were added.
