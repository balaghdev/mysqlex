# COM_STMT_PREPARE

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_prepare.html>

Creates a prepared statement for the passed query string.

The server returns a [COM_STMT_PREPARE Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_prepare.html#sect_protocol_com_stmt_prepare_response) which contains a `statement-id` which is ised to identify the prepared statement.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x16: COM_STMT_PREPARE |
| string<EOF> | query | The query to prepare | 

Example
    

1c 00 00 00 16 53 45 4c 45 43 54 20 43 4f 4e 43 .....SELECT CONC

41 54 28 3f 2c 20 3f 29 20 41 53 20 63 6f 6c 31 AT(?, ?) [AS](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a0b84664ffa026b1a5f43c051cd6fe69f) col1

[AS](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a0b84664ffa026b1a5f43c051cd6fe69f)

@ AS

**Definition:** sql_yacc.h:74

Returns
    [COM_STMT_PREPARE_OK](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_prepare.html#sect_protocol_com_stmt_prepare_response_ok) on success, [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) otherwise

See also
    mysqld_stmt_prepare, mysql_stmt_precheck, Prepared_statement, mysql_stmt_prepare, mysql_stmt_init

Note
    As LOAD DATA isn't supported by COM_STMT_PREPARE yet, no [LOCAL INFILE Request](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_local_infile_request.html) is expected here. This is unlike [COM_QUERY Response](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response.html).

#  COM_STMT_PREPARE Response

If COM_STMT_PREPARE succeeded, it sends a [COM_STMT_PREPARE_OK](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_prepare.html#sect_protocol_com_stmt_prepare_response_ok)

##  COM_STMT_PREPARE_OK

| Type | Name | Description |
| --- | --- | --- |
| int<1> | status | 0x00: OK: Ignored by cli_read_prepare_result |
| int<4> | statement_id | statement ID |
| int<2> | num_columns | Number of columns |
| int<2> | num_params | Number of parameters |
| int<1> | reserved_1 | [00] filler |
| if (packet_lenght >= 12) { |  |  |
| int<2> | warning_count | Number of warnings |
| if capabilities & CLIENT_OPTIONAL_RESULTSET_METADATA { |  |  |
| int<1> | metadata_follows | Flag specifying if metadata are skipped or not. See enum_resultset_metadata |
| } – CLIENT_OPTIONAL_RESULTSET_METADATA { |  |  |
| } – packet_lenght > 12 |  |  | 

if `num_params` > 0 and CLIENT_OPTIONAL_RESULTSET_METADATA is not set or if `medatdata_follows` is RESULTSET_METADATA_FULL `num_params` packets will follow. Then a [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) will be transmitted, provided that CLIENT_DEPRECATE_EOF is not set.

| Type | Name | Description |
| --- | --- | --- |
| num_params * Column Definition |  |  |
| if (not capabilities & CLIENT_DEPRECATE_EOF) { |  |  |
| EOF_Packet |  |  |
| } –CLIENT_DEPRECATE_EOF |  |  | 

if `num_columns` > 0 and CLIENT_OPTIONAL_RESULTSET_METADATA is not set or if `medatdata_follows` is RESULTSET_METADATA_FULL `num_columns` packets will follow. Then a [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) will be transmitted, provided that CLIENT_DEPRECATE_EOF is not set.

| Type | Name | Description |
| --- | --- | --- |
| num_columns * Column Definition |  |  |
| if (not capabilities & CLIENT_DEPRECATE_EOF) { |  |  |
| EOF_Packet |  |  |
| } –CLIENT_DEPRECATE_EOF |  |  | 

Example
    for a prepared query like SELECT CONCAT(?, ?) AS col1 and no CLIENT_OPTIONAL_RESULTSET_METADATA 

0c 00 00 01 00 01 00 00 00 01 00 02 00 00 00 00 ................

17 00 00 02 03 64 65 66 00 00 00 01 3f 00 0c 3f .....def....?..?

00 00 00 00 00 fd 80 00 00 00 00 17 00 00 03 03 ................

64 65 66 00 00 00 01 3f 00 0c 3f 00 00 00 00 00 def....?..?.....

fd 80 00 00 00 00 05 00 00 04 fe 00 00 02 00 1a ................

00 00 05 03 64 65 66 00 00 00 04 63 6f 6c 31 00 ....def....col1.

0c 3f 00 00 00 00 00 fd 80 00 1f 00 00 05 00 00 .?..............

06 fe 00 00 02 00 ...

Example
    for a a query without parameters and resultset like DO 1 and no CLIENT_OPTIONAL_RESULTSET_METADATA : 

0c 00 00 01 00 01 00 00 00 00 00 00 00 00 00 00

See also
    cli_read_prepare_result, mysql_stmt_prepare, send_statement, THD::send_result_metadata
