# Binlog Event

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html>

The events contain the actual data that should be shipped from the master to the slave.

Depending on the use, different events are sent.

#  Binlog Management

The first event is either a [START_EVENT_V3](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_start_v3) or a [FORMAT_DESCRIPTION_EVENT](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_format_desc) while the last event is either a [STOP_EVENT](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_stop) or [ROTATE_EVENT](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_rotate).

##  START_EVENT_V3

| Type | Name | Description |
| --- | --- | --- |
| int<2> | binlog-version | Version of the binlog format. See Binlog Version |
| string[50] | mysql-server version | version of the MySQL Server that created the binlog. The string is evaluated to apply workarounds on the slave. |
| int<4> | create-timestamp | seconds since Unix epoch when the binlog was created | 

##  FORMAT_DESCRIPTION_EVENT

A format description event is the first event of a binlog for binlog [Version 4](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html#sect_protocol_replication_binlog_version_v4). It described how the other events are laid out.

Note
    Added in MySQL 5.0.0 as a replacement for [START_EVENT_V3](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_start_v3).
| Type | Name | Description |
| --- | --- | --- |
| int<2> | binlog-version | Version of the binlog format. See Binlog Version |
| string[50] | mysql-server version | version of the MySQL Server that created the binlog. The string is evaluated to apply workarounds on the slave. |
| int<4> | create-timestamp | seconds since Unix epoch when the binlog was created | 

[int<1>](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#a_protocol_type_int1)

event-header-length 

Length of the [Binlog Event Header](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_binlog_event_header) of next events. Should always be 19. 

[string<EOF>](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_strings.html#sect_protocol_basic_dt_string_eof)

event type header lengths 

a array indexed by `binlog-event-type - 1` to extract the length of the event specific header 

Example
    

$ [hexdump](https://dev.mysql.com/doc/dev/mysql-server/latest/xcom__cache_8cc.html#afe16fd8b6041439b9fb6ff68b38316de) -v -s 4 -C relay-bin.000001

00000004 82 2d c2 4b 0f 02 00 00 00 67 00 00 00 6b 00 00 |.-.K.....g...k..|

00000014 00 00 00 04 00 35 2e 35 2e 32 2d 6d 32 00 00 00 |.....5.5.2-m2...|

00000024 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 |................|

00000034 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 |................|

00000044 00 00 00 00 00 00 00 82 2d c2 4b 13 38 0d 00 08 |........-.K.8...|

00000054 00 12 00 04 04 04 04 12 00 00 54 00 04 1a 08 00 |..........[T](https://dev.mysql.com/doc/dev/mysql-server/latest/jit__executor__value_8cc.html#a0acb682b8260ab1c60b918599864e2e5).....|

00000064 00 00 08 08 08 02 00 |........ |

[T](https://dev.mysql.com/doc/dev/mysql-server/latest/jit__executor__value_8cc.html#a0acb682b8260ab1c60b918599864e2e5)

#define T

**Definition:** jit_executor_value.cc:373

[hexdump](https://dev.mysql.com/doc/dev/mysql-server/latest/xcom__cache_8cc.html#afe16fd8b6041439b9fb6ff68b38316de)

void hexdump(void *p, long length)

For mysql-5.5.2-m2 the event specific header lengths are:

| Event Name | Header Length |  |
| --- | --- | --- |
| v4 | v3 | v1 |
| Binlog Event Header | 19 | 13 |
| START_EVENT_V3 | 56 |  |
| QUERY_EVENT | 13 | 11 |
| STOP_EVENT | 0 |  |
| ROTATE_EVENT | 8 | 0 |
| INTVAR_EVENT | 0 |  |
| LOAD_EVENT | 18 |  |
| SLAVE_EVENT | 0 |  |
| CREATE_FILE_EVENT | 4 |  |
| APPEND_BLOCK_EVENT | 4 |  |
| EXEC_LOAD_EVENT | 4 |  |
| DELETE_FILE_EVENT | 4 |  |
| NEW_LOAD_EVENT | 18 |  |
| RAND_EVENT | 0 |  |
| USER_VAR_EVENT | 0 |  |
| FORMAT_DESCRIPTION_EVENT | 84 | — |
| XID_EVENT | 0 | — |
| BEGIN_LOAD_QUERY_EVENT | 4 | — |
| EXECUTE_LOAD_QUERY_EVENT | 26 | — |
| TABLE_MAP_EVENT | 8 | — |
| DELETE_ROWS_EVENTv0 | 0 | — |
| UPDATE_ROWS_EVENTv0 | 0 | — |
| WRITE_ROWS_EVENTv0 | 0 | — |
| INCIDENT_EVENT | 2 | — |
| HEARTBEAT_EVENT | 0 | — |
| DELETE_ROWS_EVENTv2 | 10 | — |
| UPDATE_ROWS_EVENTv2 | 10 | — |
| WRITE_ROWS_EVENTv2 | 10 | — | 

The `event-size` of `0x67` (`103`) minus the `event-header` length of `0x13` (`19`) should match the event type header length of the [FORMAT_DESCRIPTION_EVENT](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_format_desc) `0x54` (`84`).

The number of events understood by the master may differ from what the slave supports. It is calculated by:

event_size - event_header_length - 2 - 50 - 4 - 1

For mysql-5.5.2-m2 it is `0x1b` (`27`).

##  STOP_EVENT

A [STOP_EVENT](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_event_stop) has not payload or post-header

##  ROTATE_EVENT

The rotate event is added to the binlog as last event to tell the reader what binlog to request next.

| Type | Name | Description |
| --- | --- | --- |
| if binlog-version > 1 { |  |  |
| int<8> | position |  |
| } |  |  | | Type | Name | Description |
| --- | --- | --- |
| string<EOF> | binlog | name of the next binlog | 

##  SLAVE_EVENT

Note
    Ignored !

##  INCIDENT_EVENT

| Type | Name | Description |  |
| --- | --- | --- | --- |
| int<2> | type | Hex | Name |
| 0x0000 | INCIDENT_NONE |  |  |
| 0x0001 | INCIDENT_LOST_EVENTS |  |  |
| int<1> | message_length | Length of message |  |
| binary<var> | message | Incident message with length message_length |  |   
  
##  HEARTBEAT_EVENT

An artificial event generated by the master. It isn't written to the relay logs.

It is added by the master after the replication connection was idle for `x` seconds to update the slave's Seconds_behind_source timestamp in the SHOW REPLICA STATUS output.

It has no payload nor post-header.

#  Statement Based Replication Events

Statement Based Replication or SBR sends the SQL queries a client sent to the master AS IS to the slave. It needs extra events to mimic the client connection's state on the slave side.

##  QUERY_EVENT

The query event is used to send text queries through the binlod

| Type | Name | Description |
| --- | --- | --- |
| int<4> | slave_proxy_id |  |
| int<4> | execution time |  |
| int<1> | schema length |  |
| int<2> | error code |  |
| if binlog-version >= 4 { |  |  |
| int<2> | status_vars length | Number of bytes in the following sequence of status_vars |
| } |  |  | | Type | Name | Description |  |  |
| --- | --- | --- | --- | --- |
| binary<var> | status-vars | A sequence of status key/value pairs. The key is 1-byte, while the value is dependent on the key Hex | Flag | Value Length |
| 0x00 | Q_FLAGS2_CODE | 4 |  |  |
| 0x01 | Q_SQL_MODE_CODE | 8 |  |  |
| 0x02 | Q_AUTO_INCREMENT | 1 + n + 1 |  |  |
| 0x03 | Q_CATALOG | 2 + 2 |  |  |
| 0x04 | Q_CHARSET_CODE | 2 + 2 + 2 |  |  |
| 0x05 | Q_TIME_ZONE_CODE | 1 + 1 |  |  |
| 0x06 | Q_CATALOG_NZ_CODE | 1 + n |  |  |
| 0x07 | Q_LC_TIME_NAMES_CODE | 2 |  |  |
| 0x08 | Q_CHARSET_DATABASE_CODE | 2 |  |  |
| 0x09 | Q_TABLE_MAP_FOR_UPDATE_CODE | 8 |  |  |
| 0x0a | Q_SOURCE_DATA_WRITTEN_CODE | 4 |  |  |
| 0x0b | Q_INVOKERS | 1 + n + 1 + n |  |  |
| 0x0c | Q_UPDATED_DB_NAMES | 1 + n*nul-term-string |  |  |
| 0x0d | Q_MICROSECONDS | 3 |  |  | 

The value of the different status vars are:

**Q_FLAGS2_CODE**

Bitmask of flags that are usually set with the SET command:

SQL_AUTO_IS_NULL FOREIGN_KEY_CHECKS UNIQUE_CHECKS AUTOCOMMIT

| Hex | Flag |
| --- | --- |
| 0x00004000 | OPTION_AUTO_IS_NULL |
| 0x00080000 | OPTION_NOT_AUTOCOMMIT |
| 0x04000000 | OPTION_NO_FOREIGN_KEY_CHECKS |
| 0x08000000 | OPTION_RELAXED_UNIQUE_CHECKS | 

**Q_SQL_MODE_CODE**

Bitmask of flags that are usually set with SET sql_mode:

| Hex | Flag |
| --- | --- |
| 0x00000001 | MODE_REAL_AS_FLOAT |
| 0x00000002 | MODE_PIPES_AS_CONCAT |
| 0x00000004 | MODE_ANSI_QUOTES |
| 0x00000008 | MODE_IGNORE_SPACE |
| 0x00000010 | MODE_NOT_USED |
| 0x00000020 | MODE_ONLY_FULL_GROUP_BY |
| 0x00000040 | MODE_NO_UNSIGNED_SUBTRACTION |
| 0x00000080 | MODE_NO_DIR_IN_CREATE |
| 0x00000100 | MODE_POSTGRESQL |
| 0x00000200 | MODE_ORACLE |
| 0x00000400 | MODE_MSSQL |
| 0x00000800 | MODE_DB2 |
| 0x00001000 | MODE_MAXDB |
| 0x00002000 | MODE_NO_KEY_OPTIONS |
| 0x00004000 | MODE_NO_TABLE_OPTIONS |
| 0x00008000 | MODE_NO_FIELD_OPTIONS |
| 0x00010000 | MODE_MYSQL323 |
| 0x00020000 | MODE_MYSQL40 |
| 0x00040000 | MODE_ANSI |
| 0x00080000 | MODE_NO_AUTO_VALUE_ON_ZERO |
| 0x00100000 | MODE_NO_BACKSLASH_ESCAPES |
| 0x00200000 | MODE_STRICT_TRANS_TABLES |
| 0x00400000 | MODE_STRICT_ALL_TABLES |
| 0x00800000 | MODE_NO_ZERO_IN_DATE |
| 0x01000000 | MODE_NO_ZERO_DATE |
| 0x02000000 | MODE_INVALID_DATES |
| 0x04000000 | MODE_ERROR_FOR_DIVISION_BY_ZERO |
| 0x08000000 | MODE_TRADITIONAL |
| 0x10000000 | MODE_NO_AUTO_CREATE_USER |
| 0x20000000 | MODE_HIGH_NOT_PRECEDENCE |
| 0x40000000 | MODE_NO_ENGINE_SUBSTITUTION |
| 0x80000000 | MODE_PAD_CHAR_TO_FULL_LENGTH | 

**Q_AUTO_INCREMENT**

2 byte autoincrement-increment and 2 byte autoincrement-offset

Note
    Only written if the -increment is > 1

**Q_CATALOG**

1 byte length + <length> chars of the cataiog + '0'-char

Note
    Only written if length > 0

**Q_CHARSET_CODE**

2 bytes character_set_client + 2 bytes collation_connection + 2 bytes collation_server

See [Character Set](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_character_set.html)

**Q_TIME_ZONE_CODE**

1 byte length + <length> chars of the timezone.

Timezone the master is in.

Note
    only written when length > 0

**Q_CATALOG_NZ_CODE**

1 byte length + <length> chars of the catalog.

Note
    only written when length > 0

**Q_LC_TIME_NAMES_CODE**

LC_TIME of the server. Defines how to parse week-, month and day-names in timestamps

Note
    only written when length > 0

**Q_CHARSET_DATABASE_CODE**

character set and collation of the schema

**Q_TABLE_MAP_FOR_UPDATE_CODE**

a 64bit field ... should only be used in [Row Based Replication Events](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_binlog_event_rbr) and multi-table updates

**Q_MASTER_DATA_WRITTEN_CODE**

4 byte ...

**Q_INVOKERS**

1 byte length + <length> bytes username and 1 byte length + <length> bytes hostname

**Q_UPDATED_DB_NAMES**

1 byte count + <count> \0 terminated string

**Q_MICROSECONDS**

3 byte microseconds  
  
[binary<var>](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_strings.html#sect_protocol_basic_dt_string_var) | schema |   
[binary<eof>](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_strings.html#sect_protocol_basic_dt_string_eof) | query | text of the query   
  
##  INTVAR_EVENT

##  RAND_EVENT

##  USER_VAR_EVENT

##  XID_EVENT

#  Row Based Replication Events

In Row Based replication the changed rows are sent to the slave which removes side-effects and makes it more reliable. Now all statements can be sent with RBR though. Most of the time you will see RBR and SBR side by side.

##  TABLE_MAP_EVENT

##  DELETE_ROWS_EVENTv0

##  UPDATE_ROWS_EVENTv0

##  WRITE_ROWS_EVENTv0

##  DELETE_ROWS_EVENTv2

##  UPDATE_ROWS_EVENTv2

##  WRITE_ROWS_EVENTv2

#  LOAD INFILE replication

`LOAD DATA|XML INFILE` is a special SQL statement as it has to ship the files over to the slave too to execute the statement.

##  LOAD_EVENT

##  CREATE_FILE_EVENT

##  APPEND_BLOCK_EVENT

##  EXEC_LOAD_EVENT

##  DELETE_FILE_EVENT

##  NEW_LOAD_EVENT

##  BEGIN_LOAD_QUERY_EVENT

##  EXECUTE_LOAD_QUERY_EVENT

A binlog event starts with [Binlog Event Header](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication_binlog_event.html#sect_protocol_replication_binlog_event_header) and is followed by a event specific part.

#  Binlog Event Header

The binlog event header starts each event and is either 13 or 19 bytes long, depending on the [Binlog Version](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html#sect_protocol_replication_binlog_version)

| Type | Name | Description |
| --- | --- | --- |
| int<2> | binlog-version | Version of the binlog format. See Binlog Version |
| string[50] | mysql-server version | version of the MySQL Server that created the binlog. The string is evaluated to apply workarounds on the slave. |
| int<4> | create-timestamp | seconds since Unix epoch when the binlog was created |0
