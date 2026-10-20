# COM_STMT_EXECUTE Response

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_execute_response.html>

Similar to the [COM_QUERY Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response.html) a COM_STMT_EXECUTE returns either:

  * a [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)
  * a [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)
  * [Binary Protocol Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_binary_resultset.html)
