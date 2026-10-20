# COM_STMT_EXECUTE

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_execute.html>

COM_STMT_EXECUTE asks the server to execute a prepared statement as identified by `statement_id`.

It sends the values for the placeholders of the prepared statement (if it contained any) in [Binary Protocol Value](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row_value) form. The type of each parameter is made up of two bytes:

  * the type as in [enum_field_types](https://dev.mysql.com/doc/dev/mysql-server/latest/field__types_8h.html#a69e798807026a0f7e12b1d6c72374854)
  * a flag byte which has the highest bit set if the type is unsigned [80]

The `num_params` used for this packet refers to `num_params` of the [COM_STMT_PREPARE_OK](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_prepare.html#sect_protocol_com_stmt_prepare_response_ok) of the corresponding prepared statement.

The server will use the first num_params (from prepare) parameter values to satisfy the positional anonymous question mark parameters in the statement executed regardless of whether they have names supplied or not. The rest num_remaining_attrs parameter values will just be stored into the THD and if they have a name they can later be accessed as query attributes. If any of the first num_params parameter values has a name supplied they could then be accessed as a query attribute too. If supplied, parameter_count will overwrite the num_params value by eventually adding a non-zero num_params_remaining value to the original num_params.

Returns
    [COM_STMT_EXECUTE Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_execute_response.html)
| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | [0x17] COM_STMT_EXECUTE |
| int<4> | statement_id | ID of the prepared statement to execute |
| int<1> | flags | Flags. See enum_cursor_type |
| int<4> | iteration_count | Number of times to execute the statement. Currently always 1. |
| if (num_params > 0 \|\| (CLIENT_QUERY_ATTRIBUTES && (flags & PARAMETER_COUNT_AVAILABLE)) { |  |  |
| if CLIENT_QUERY_ATTRIBUTES is on { |  |  |
| int<lenenc> | parameter_count | The number of parameter metadata and values supplied. Overrides the count coming from prepare (num_params) if present. |
| } – if CLIENT_QUERY_ATTRIBUTES is on |  |  |
| if (parameter_count > 0) { |  |  |
| binary<var> | null_bitmap | NULL bitmap, length= (paramater_count + 7) / 8 |
| int<1> | new_params_bind_flag | Flag if parameters must be re-bound |
| if new_params_bind_flag, for each parameter { |  |  |
| int<2> | parameter_type | Type of the parameter value. See enum_field_types. The MSB is reserved for unsigned flag. |
| if CLIENT_QUERY_ATTRIBUTES is on { |  |  |
| string<lenenc> | parameter_name | Name of the parameter or empty if not present |
| } – if CLIENT_QUERY_ATTRIBUTES is on |  |  |
| } – if new_params_bind_flag is on |  |  |
| binary<var> | parameter_values | value of each parameter |
| } – if (parameter_count > 0) |  |  |
| } – if (num_params > 0 \|\| (CLIENT_QUERY_ATTRIBUTES && (flags & PARAMETER_COUNT_AVAILABLE)) |  |  | 

Example
    

12 00 00 00 17 01 00 00 00 00 01 00 00 00 00 01 ................

0f 00 03 66 6f 6f ...foo

`null_bitmap` is like the NULL-bitmap for the [Binary Protocol Resultset Row](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html#sect_protocol_binary_resultset_row) just that it has a bit_offset of 0.

See also
    mysql_stmt_execute, cli_stmt_execute, mysql_stmt_precheck, mysqld_stmt_execute
