# OK_Packet

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html>

An OK packet is sent from the server to the client to signal successful completion of a command.

As of MySQL 5.7.5, OK packets are also used to indicate EOF, and EOF packets are deprecated.

if CLIENT_PROTOCOL_41 is set, the packet contains a warning count.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | header | 0x00 or 0xFE the OK packet header |
| int<lenenc> | affected_rows | affected rows |
| int<lenenc> | last_insert_id | last insert-id |
| if capabilities & CLIENT_PROTOCOL_41 { |  |  |
| int<2> | status_flags | SERVER_STATUS_flags_enum |
| int<2> | warnings | number of warnings |
| } else if capabilities & CLIENT_TRANSACTIONS { |  |  |
| int<2> | status_flags | SERVER_STATUS_flags_enum |
| } |  |  |
| if capabilities & CLIENT_SESSION_TRACK { |  |  |
| if (status_flags & SERVER_SESSION_STATE_CHANGED) OR (status is not empty) { |  |  |
| string<lenenc> | info | human readable status information |
| } – if (status_flags & SERVER_SESSION_STATE_CHANGED) OR (s... |  |  |
| if status_flags & SERVER_SESSION_STATE_CHANGED { |  |  |
| string<lenenc> | session state info | Session State Information |
| } if status_flags & SERVER_SESSION_STATE_CHANGED |  |  |
| } else { – if capabilities & CLIENT_SESSION_TRACK |  |  |
| string<EOF> | info | human readable status information |
| } – if capabilities & CLIENT_SESSION_TRACK |  |  | 

These rules distinguish whether the packet represents OK or EOF:

  * OK: header = 0 and length of packet >= 7
  * EOF: header = 0xfe and length of packet < 8

To ensure backward compatibility between old (prior to 5.7.5) and new (5.7.5 and up) versions of MySQL, new clients advertise the CLIENT_DEPRECATE_EOF flag:

  * Old clients do not know about this flag and do not advertise it. Consequently, the server does not send OK packets that represent EOF. (Old servers never do this, anyway. New servers recognize the absence of the flag to mean they should not.)
  * New clients advertise this flag. Old servers do not know this flag and do not send OK packets that represent EOF. New servers recognize the flag and can send OK packets that represent EOF.

# Example 

OK with CLIENT_PROTOCOL_41. 0 affected rows, last-insert-id was 0, AUTOCOMMIT enabled, 0 warnings. No further info.

07 00 00 02 00 00 00 02 00 00 00

#  Session State Information

State-change information is sent in the OK packet as a array of state-change blocks which are made up of:

| Type | Name | Description |
| --- | --- | --- |
| int<1> | type | type of data. See enum_session_state_type |
| string<lenenc> | data | data of the changed session info | 

Interpretation of the data field depends on the type value:

##  SESSION_TRACK_SYSTEM_VARIABLES

| Type | Name | Description |
| --- | --- | --- |
| string<lenenc> | name | name of the changed system variable |
| string<lenenc> | value | value of the changed system variable | 

Example:

After a SET autocommit = OFF statement: 

| 00 00 0f1 0a 61 75 74 6f 63 6f 6d 6d 69 74 03 4f 46 46 | ....autocommit.OFF classic_protocol::status::pos::autocommitconstexpr value_type autocommitDefinition: classic_protocol_constants.h:152 |
| --- | --- | 

##  SESSION_TRACK_SCHEMA

| Type | Name | Description |
| --- | --- | --- |
| string<lenenc> | name | name of the changed schema | 

Example:

After a USE test statement:

| 01 00 05 04 74 65 73 74 | ...test |
| --- | --- | 

##  SESSION_TRACK_STATE_CHANGE

A flag byte that indicates whether session state changes occurred. This flag is represented as an ASCII value.

| Type | Name | Description |
| --- | --- | --- |
| string<lenenc> | is_tracked | 0x31 ("1") if state tracking got enabled. | 

Example:

After a SET SESSION session_track_state_change = 1 statement:

| 03 02 00 01 31 | ...1 |
| --- | --- | 

See also net_send_ok()
