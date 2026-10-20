# Text Resultset

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset.html>

A Text Resultset is a possible [COM_QUERY Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response.html).

It is made up of 2 parts:

  * the column definitions (a.k.a. the metadata)
  * the actual rows

The column definitions part starts with a packet containing the column-count, followed by as many [Column Definition](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_column_definition.html) packets as there are columns and terminated by a [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) if the CLIENT_DEPRECATE_EOF is not set.

Each row is a packet, too. The rows are terminated by another [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html). In case the query could generate the [Column Definition](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_column_definition.html) set, but generating the rows afterwards failed, a [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) may be sent instead of the last [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html).

| Type | Name | Description |
| --- | --- | --- |
| if capabilities & CLIENT_OPTIONAL_RESULTSET_METADATA { |  |  |
| int<1> | metadata_follows | Flag specifying if metadata are skipped or not. See enum_resultset_metadata |
| } |  |  |
| int<lenenc> | column_count | Number of Column Definition to follow |
| if (not (capabilities & CLIENT_OPTIONAL_RESULTSET_METADATA)) or metadata_follows == RESULTSET_METADATA_FULL { |  |  |
| column_count x Column Definition | Field metadata | one Column Definition for each field up to column_count |
| } |  |  |
| if (not capabilities & CLIENT_DEPRECATE_EOF) { |  |  |
| EOF_Packet | End of metadata | Marker to set the end of metadata |
| } |  |  |
| One or more Text Resultset Row | The row data | each Text Resultset Row contains column_count values |
| if (error processing) { |  |  |
| ERR_Packet | terminator | Error details |
| } else if capabilities & CLIENT_DEPRECATE_EOF { |  |  |
| OK_Packet | terminator | All the execution details |
| } else { |  |  |
| EOF_Packet | terminator | end of resultset marker |
| } |  |  | 

If the SERVER_MORE_RESULTS_EXISTS flag is set in the last [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) / [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html), another [Text Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset.html) will follow. See Multi-resultset.

Note
    if CLIENT_OPTIONAL_RESULTSET_METADATA is on, there might be no column descriptions sent and one extra flag is sent before the column counts.

See also
    Protocol_classic::send_field_metadata, THD::send_result_metadata
