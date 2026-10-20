# COM_QUERY

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query.html>

Send a [Text Protocol](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_text.html) based SQL query

Execution starts immediately.

If the client and server support it, the values for the named parameters of the query are sent (if any) in [Binary Protocol Value](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row_value) form. The type of each parameter is made up of two bytes (except for the parameter name):

  * the type as in [enum_field_types](https://dev.mysql.com/doc/dev/mysql-server/latest/field__types_8h.html#a69e798807026a0f7e12b1d6c72374854)
  * a flag byte which has the highest bit set if the type is unsigned [80]

Returns
    

  * [COM_QUERY Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response.html)

| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x03: COM_QUERY |
| if CLIENT_QUERY_ATTRIBUTES is set { |  |  |
| int<lenenc> | parameter_count | Number of parameters |
| int<lenenc> | parameter_set_count | Number of parameter sets. Currently always 1 |
| if parameter_count > 0 { |  |  |
| binary<var> | null_bitmap | NULL bitmap, length= (num_params + 7) / 8 |
| int<1> | new_params_bind_flag | Always 1. Malformed packet error if not 1 |
| if new_params_bind_flag, for each parameter { |  |  |
| int<2> | param_type_and_flag | Parameter type (2 bytes). The MSB is reserved for unsigned flag. See enum_field_types |
| string<lenenc> | parameter name | String |
| } |  |  |
| binary<var> | parameter_values | value of each parameter: Binary Protocol Value |
| } |  |  |
| } |  |  |
| string<EOF> | query | the text of the SQL query to execute | 

Example
    

2B 00 00 00 03 01 01 00 01 fe 00 01 61 01 31 73 +....... ....a.1s

65 6c 65 63 74 20 40 40 76 65 72 73 69 6f 6e 5f elect @@version_c

63 6f 6d 6d 65 6e 74 20 6c 69 6d 69 74 20 31 omment limit 1

`null_bitmap` is like the NULL-bitmap for the [Binary Protocol Resultset Row](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row) just that it has a bit_offset of 0.

See also
    [Protocol_classic::parse_packet](https://dev.mysql.com/doc/dev/mysql-server/latest/classProtocol__classic.html#a10881ef1e393483e7941afa756bc94f1), [dispatch_command](https://dev.mysql.com/doc/dev/mysql-server/latest/group__GROUP__PARSER.html#gabf07206792036bfb47e5bb8eb0f20bc4), [dispatch_sql_command](https://dev.mysql.com/doc/dev/mysql-server/latest/group__GROUP__PARSER.html#gaf3f17c9effffae007a4b8d158afbafbe), [alloc_query](https://dev.mysql.com/doc/dev/mysql-server/latest/group__GROUP__PARSER.html#ga8b3573b4adc788a4eeddbf6d1cb12582), [THD::set_query](https://dev.mysql.com/doc/dev/mysql-server/latest/classTHD.html#a1c09d48d6adc28360cc4d8ea16ae5e59)
