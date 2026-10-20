# Column Definition

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_column_definition.html>

if CLIENT_PROTOCOL_41 is set [Protocol::ColumnDefinition41:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_column_definition.html#sect_protocol_com_query_response_text_resultset_column_definition_41) is used, [Protocol::ColumnDefinition320:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_column_definition.html#sec_protocol_com_query_response_text_resultset_column_definition_320)

#  Protocol::ColumnDefinition41:

| Type | Name | Description |
| --- | --- | --- |
| string<lenenc> | catalog | The catalog used. Currently always "def" |
| string<lenenc> | schema | schema name |
| string<lenenc> | table | virtual table name |
| string<lenenc> | org_table | physical table name |
| string<lenenc> | name | virtual column name |
| string<lenenc> | org_name | physical column name |
| int<lenenc> | length of fixed length fields | [0x0c] |
| int<2> | character_set | the column character set as defined in Character Set |
| int<4> | column_length | maximum length of the field |
| int<1> | type | type of the column as defined in enum_field_types |
| int<2> | flags | Flags as defined in Column Definition Flags |
| int<1> | decimals | max shown decimal digits: 0x00 for integers and static strings 0x1f for dynamic strings, double, float 0x00 to 0x51 for decimals |
| string[2] | reserved | reserved for future use. |
| if command was COM_FIELD_LIST { |  |  |
| string<lenenc> | default value | NULL if 0xFB |
| } |  |  | 

Note
    `decimals` and `column_length` can be used for text output formatting

#  Protocol::ColumnDefinition320:

| Type | Name | Description |
| --- | --- | --- |
| string<lenenc> | table | Table name |
| string<lenenc> | name | Column name |
| int<lenenc> | length of type field | [01] |
| int<1> | type | type of the column as defined in enum_field_types |
| if capabilities & CLIENT_LONG_FLAG { |  |  |
| int<lenenc> | length of flags + decimals fields | [03] |
| int<2> | flags | Flags as defined in Column Definition Flags |
| int<1> | decimals | number of decimal digits |
| } else { |  |  |
| int<lenenc> | length of flags + decimals fields | [02] |
| int<2> | flags | Flags as defined in Column Definition Flags |
| int<1> | decimals | number of decimal digits |
| } |  |  |
| if command was COM_FIELD_LIST { |  |  |
| string<lenenc> | default_value | NULL if 0xFB |
| } |  |  | 

See also
    Protocol_classic::send_field_metadata
