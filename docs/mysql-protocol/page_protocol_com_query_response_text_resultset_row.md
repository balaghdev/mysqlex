# Text Resultset Row

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset_row.html>

ProtocolText::ResultsetRow:

A row with data for each column.

  * NULL is sent as `0xFB`
  * everything else is converted to a string and is sent as [string<lenenc>](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_strings.html#sect_protocol_basic_dt_string_le)

See also
    THD::send_result_set_row, Protocol_text
