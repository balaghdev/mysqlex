# COM_STMT_FETCH

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_fetch.html>

Fetches the requested amount of rows from a resultset produced by COM_STMT_EXECUTE

Returns
    [COM_STMT_FETCH Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_fetch.html#sect_protocol_com_stmt_fetch_response)
| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | [0x1C] COM_STMT_FETCH |
| int<4> | statement_id | ID of the prepared statement to close |
| int<4> | num_rows | max number of rows to return | 

See also
    [mysqld_stmt_fetch](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__prepare_8h.html#a0b3cbb0ed386a5054745690630481c31)
     [mysql_stmt_fetch](https://dev.mysql.com/doc/dev/mysql-server/latest/libmysql_8cc.html#a583682a3e86aba1275973342a5919e5d)

#  COM_STMT_FETCH Response

[COM_STMT_FETCH](https://dev.mysql.com/doc/dev/mysql-server/latest/my__command_8h.html#ae2ff1badf13d2b8099af8b47831281e1a090f3f63e17b3eefe43bb45458568e38) may return one of:

  * [Multi-Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_sp.html#sect_protocol_command_phase_sp_multi_resultset)
  * [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)
