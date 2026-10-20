# Binary Protocol Resultset

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html>

Binary Protocol Resultset is similar to the [Text Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset.html).

It just contains the rows in [Binary Protocol Resultset Row](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row) format.

| Type | Name | Description |
| --- | --- | --- |
| int<lenenc> | column_count | always grater than 0 |
| column_count * Column Definition |  |  |
| None or many Binary Protocol Resultset Row |  |  |
| EOF_Packet |  |  | 

Note
    if CLIENT_DEPRECATE_EOF client capability flag is set, [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) is sent, else [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) is sent.

Example
    

01 00 00 01 01|1a 00 00 02 03 64 65 66 00 00 00 ..........def...

04 63 6f 6c 31 00 0c 08 00 06 00 00 00 fd 00 00 .col1...........

1f 00 00|05 00 00 03 fe 00 00 02 00|09 00 00 04 ................

00 00 06 66 6f 6f 62 61 72|05 00 00 05 fe 00 00 ...foobar.......

02 00

#  Binary Protocol Resultset Row

A Binary Protocol Resultset Row is made up of a `NULL bitmap` containing as many bits as we have columns in the resultset + 2 and the `values` for columns that are not NULL in the [Binary Protocol Value](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row_value) format.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | packet_header | [0x00] packer header |
| binary<var> | null_bitmap | NULL bitmap, length= (column_count + 7 + 2) / 8 |
| binary<var> | values | values for non-null columns | 

Example
    

09 00 00 04 00 00 06 66 6f 6f 62 61 72

##  NULL-Bitmap

The binary protocol sends NULL values as bits inside a bitmap instead of a full byte as the [Text Resultset Row](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_row.html) does. If many NULL values are sent, it is more efficient than the old way.

Caution
    For the [Binary Protocol Resultset Row](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row) the num_fields and the field_pos need to add a offset of 2. For COM_STMT_EXECUTE this offset is 0.

The NULL-bitmap needs enough space to store a possible NULL bit for each column that is sent. Its space is calculated with: 

[NULL](https://dev.mysql.com/doc/dev/mysql-server/latest/types_8h.html#a070d2ce7b6bb7e5c05602aa8c308d0c4)-bitmap-bytes = (num_fields + 7 + offset) / 8

[NULL](https://dev.mysql.com/doc/dev/mysql-server/latest/types_8h.html#a070d2ce7b6bb7e5c05602aa8c308d0c4)

#define NULL

**Definition:** types.h:55

resulting in:

| num_fields+offset | NULL_bitmap bytes |
| --- | --- |
| 0 | 0 |
| 1 | 1 |
| [...] | [...] |
| 8 | 1 |
| 9 | 2 |
| [...] | [...] | 

To store a NULL bit in the bitmap, you need to calculate the bitmap-byte (starting with 0) and the bitpos (starting with 0) in that byte from the index_field (starting with 0):

[NULL](https://dev.mysql.com/doc/dev/mysql-server/latest/types_8h.html#a070d2ce7b6bb7e5c05602aa8c308d0c4)-bitmap-byte = ((field-pos + offset) / 8)

[NULL](https://dev.mysql.com/doc/dev/mysql-server/latest/types_8h.html#a070d2ce7b6bb7e5c05602aa8c308d0c4)-bitmap-bit = ((field-pos + offset) % 8)

Example
    

[Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacemrs__component.html#aa536e993375a2f1239ee7139cdf7a89f) [Row](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegr__resource__manager.html#a2f339ad1dde3408f7fdab98345113d2b), 9 fields, 9th field is a [NULL](https://dev.mysql.com/doc/dev/mysql-server/latest/types_8h.html#a070d2ce7b6bb7e5c05602aa8c308d0c4) (9th field -> field-[index](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacehelper.html#aee80df0feaa50abd87418fc93f138535) == 8, offset == 2)

nulls -> [00] [00]

byte_pos = (10 / 8) = 1

bit_pos = (10 % 8) = 2

nulls[byte_pos] |= 1 << bit_pos

nulls[1] |= 1 << 2;

nulls -> [00] [04]

[gr_resource_manager::Row](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacegr__resource__manager.html#a2f339ad1dde3408f7fdab98345113d2b)

std::vector< std::string > Row

**Definition:** resource_manager_query.h:12

[helper::index](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacehelper.html#aee80df0feaa50abd87418fc93f138535)

bool index(const std::string &value, const String &search_for, uint32_t *idx)

**Definition:** contains.h:76

[mrs_component::Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacemrs__component.html#aa536e993375a2f1239ee7139cdf7a89f)

std::vector< Row > Resultset

**Definition:** mrs_component_command_executor.h:43

#  Binary Protocol Value

##  ProtocolBinary::MYSQL_TYPE_STRING, ProtocolBinary::MYSQL_TYPE_VARCHAR, ProtocolBinary::MYSQL_TYPE_VAR_STRING, ProtocolBinary::MYSQL_TYPE_ENUM, ProtocolBinary::MYSQL_TYPE_SET, ProtocolBinary::MYSQL_TYPE_LONG_BLOB, ProtocolBinary::MYSQL_TYPE_MEDIUM_BLOB, ProtocolBinary::MYSQL_TYPE_BLOB, ProtocolBinary::MYSQL_TYPE_TINY_BLOB, ProtocolBinary::MYSQL_TYPE_GEOMETRY, ProtocolBinary::MYSQL_TYPE_BIT, ProtocolBinary::MYSQL_TYPE_DECIMAL, ProtocolBinary::MYSQL_TYPE_NEWDECIMAL, ProtocolBinary::MYSQL_TYPE_JSON

| Type | Name | Description |
| --- | --- | --- |
| string<lenenc> | value | String | 

Example
    

03 66 6f 6f -- string = "foo"

##  ProtocolBinary::MYSQL_TYPE_LONGLONG

| Type | Name | Description |
| --- | --- | --- |
| int<8> | value | integer | 

Example
    

01 00 00 00 00 00 00 00 -- [int64](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#a7cde0074dfd288f2d70c0e035dacb28a) = 1

[int64](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#a7cde0074dfd288f2d70c0e035dacb28a)

int64_t int64

**Definition:** my_inttypes.h:68

##  ProtocolBinary::MYSQL_TYPE_LONG, ProtocolBinary::MYSQL_TYPE_INT24

| Type | Name | Description |
| --- | --- | --- |
| int<4> | value | integer | 

Example
    

01 00 00 00 -- [int32](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#ab7903878916593daecbeb95b98115ab0) = 1

[int32](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#ab7903878916593daecbeb95b98115ab0)

int32_t int32

**Definition:** my_inttypes.h:66

##  ProtocolBinary::MYSQL_TYPE_SHORT, ProtocolBinary::MYSQL_TYPE_YEAR

| Type | Name | Description |
| --- | --- | --- |
| int<2> | value | integer | 

Example
    

01 00 -- [int16](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#aa0d0fdc87fd135ef2bedb030901cdb9c) = 1

[int16](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#aa0d0fdc87fd135ef2bedb030901cdb9c)

int16_t int16

**Definition:** my_inttypes.h:64

##  ProtocolBinary::MYSQL_TYPE_TINY

| Type | Name | Description |
| --- | --- | --- |
| int<1> | value | integer | 

Example
    

01 -- [int8](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#aa79c2d3de4fcd200458c406f40b2ae64) = 1

[int8](https://dev.mysql.com/doc/dev/mysql-server/latest/my__inttypes_8h.html#aa79c2d3de4fcd200458c406f40b2ae64)

int8_t int8

**Definition:** my_inttypes.h:62

##  ProtocolBinary::MYSQL_TYPE_DOUBLE

MYSQL_TYPE_DOUBLE stores a floating point in IEEE 754 double precision format.

First byte is the last byte of the significant as stored in C.

| Type | Name | Description |
| --- | --- | --- |
| string[8] | value | a IEEE 754 double precision format (8 bytes) double | 

Example
    

66 66 66 66 66 66 24 40 -- double = 10.2

##  ProtocolBinary::MYSQL_TYPE_FLOAT

MYSQL_TYPE_FLOAT stores a floating point in IEEE 754 single precision format.

| Type | Name | Description |
| --- | --- | --- |
| string[4] | value | a IEEE 754 single precision format (4 bytes) float | 

Example
    

33 33 23 41 -- float = 10.2

##  ProtocolBinary::MYSQL_TYPE_DATE, ProtocolBinary::MYSQL_TYPE_DATETIME, ProtocolBinary::MYSQL_TYPE_TIMESTAMP:

Type to store a MYSQL_TYPE_DATE, MYSQL_TYPE_DATETIME and MYSQL_TYPE_TIMESTAMP fields in the binary protocol.

To save space the packet can be compressed:

  * if year, month, day, hour, minutes, seconds and microseconds are all 0, length is 0 and no other field is sent.
  * if hour, seconds and microseconds are all 0, length is 4 and no other field is sent.
  * if microseconds is 0, length is 7 and micro_seconds is not sent.
  * otherwise the length is 11

| Type | Name | Description |
| --- | --- | --- |
| int<1> | packet_header | [0x00] packer header |
| binary<var> | null_bitmap | NULL bitmap, length= (column_count + 7 + 2) / 8 |
| binary<var> | values | values for non-null columns |0 

Example
    

0b da 07 0a 11 13 1b 1e 01 00 00 00 -- datetime 2010-10-17 19:27:30.000 001

04 da 07 0a 11 -- date = 2010-10-17

0b da 07 0a 11 13 1b 1e 01 00 00 00 -- [timestamp](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceclassic__protocol_1_1column__def_1_1pos.html#a6d04089333904a21dd2599935ceb3688)

[classic_protocol::column_def::pos::timestamp](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceclassic__protocol_1_1column__def_1_1pos.html#a6d04089333904a21dd2599935ceb3688)

constexpr value_type timestamp

**Definition:** classic_protocol_constants.h:278

##  ProtocolBinary::MYSQL_TYPE_TIME

Type to store a MYSQL_TYPE_TIME field in the binary protocol.

To save space the packet can be compressed:

  * if day, hour, minutes, seconds and microseconds are all 0, length is 0 and no other field is sent.
  * if microseconds is 0, length is 8 and micro_seconds is not sent.
  * otherwise the length is 12

| Type | Name | Description |
| --- | --- | --- |
| int<1> | packet_header | [0x00] packer header |
| binary<var> | null_bitmap | NULL bitmap, length= (column_count + 7 + 2) / 8 |
| binary<var> | values | values for non-null columns |1 

Example
    

0c 01 78 00 00 00 13 1b 1e 01 00 00 00 -- time -120d 19:27:30.000 001

08 01 78 00 00 00 13 1b 1e -- time -120d 19:27:30

01 -- time 0d 00:00:00

##  ProtocolBinary::MYSQL_TYPE_NULL

stored in the [NULL-Bitmap](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row_null_bitmap) only
