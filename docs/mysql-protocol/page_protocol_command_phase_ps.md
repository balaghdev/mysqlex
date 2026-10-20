# Prepared Statements

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_ps.html>

The prepared statement protocol was introduced in MySQL 4.1 and adds a few new commands:

  * [COM_STMT_PREPARE](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_prepare.html)
  * [COM_STMT_EXECUTE](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_execute.html)
  * [COM_STMT_FETCH](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_fetch.html)
  * [COM_STMT_CLOSE](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_close.html)
  * [COM_STMT_RESET](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_reset.html)
  * [COM_STMT_SEND_LONG_DATA](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_send_long_data.html)

It also defines a more compact resultset format that is used instead of [Text Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_text_resultset.html) to return the results.

Note
    Keep in mind that not all SQL statements can be prepared.

See also
    [WL#2871](https://dev.mysql.com/worklog/task/?id=2871)
