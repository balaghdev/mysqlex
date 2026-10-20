# COM_FIELD_LIST

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_field_list.html>

Note
    As of MySQL 5.7.11, COM_FIELD_LIST is deprecated and will be removed in a future version of MySQL. Instead, use COM_QUERY to execute a SHOW COLUMNS statement. | Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x04: COM_FIELD_LIST |
| string<NUL> | table | the name of the table to return column information for (in the current database for the connection) |
| string<EOF> | wildcard | field wildcard | 

Returns
    [COM_FIELD_LIST Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_field_list.html#sect_protocol_com_field_list_response)

See also
    mysql_list_fields, mysqld_list_fields 

#  COM_FIELD_LIST Response

The response to [COM_FIELD_LIST](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_field_list.html) can be one of:

  * [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)
  * zero or more [Column Definition](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_column_definition.html)
  * a closing [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html)

Warning
    if CLIENT_OPTIONAL_RESULTSET_METADATA is on and the server side variable Sys_resultset_metadata is not set to RESULTSET_METADATA_FULL no rows will be sent, just an empty resultset.

31 00 00 01 03 64 65 66 04 74 65 73 74 09 66 69 1....def.test.fi

65 6c 64 6c 69 73 74 09 66 69 65 6c 64 6c 69 73 eldlist.fieldlis

74 02 69 64 02 69 64 0c 3f 00 0b 00 00 00 03 00 t.id.id.?.......

00 00 00 00 fb 05 00 00 02 fe 00 00 02 00 ..............

See also
    mysql_list_fields, mysqld_list_fields, THD::send_result_metadata, dispatch_command, cli_list_fields
