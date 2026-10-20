# COM_QUERY Response

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response.html>

The query response packet is a meta packet which can be one of:

  * [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)
  * [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)
  * [LOCAL INFILE Request](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_local_infile_request.html)
  * [Text Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset.html)

Note
    if CLIENT_DEPRECATE_EOF is on, [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) is sent instead of an actual [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) packet.

See also
    cli_read_query_result, mysql_send_query, mysql_execute_command
