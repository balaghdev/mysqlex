# LOCAL INFILE Request

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_local_infile_request.html>

If the client wants to `LOAD DATA` from a `LOCAL` file into the server it sends:

[LOAD](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#a0b674752cca6d434a1a69f40877eb2be) DATA [LOCAL](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceMysqlx_1_1Crud.html#ac9d4b4fe3d826d2d9101c6b9884cd9dfa7d642e4a0fa679d9c99e33959a951fb0) INFILE '<filename>' [INTO](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8aab0fb930b459cfb52c8929bc8f048c4f) [TABLE <table>](https://dev.mysql.com/doc/dev/mysql-server/latest/structTABLE.html);

[Mysqlx::Crud::LOCAL](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceMysqlx_1_1Crud.html#ac9d4b4fe3d826d2d9101c6b9884cd9dfa7d642e4a0fa679d9c99e33959a951fb0)

@ LOCAL

the view WHERE clause is checked, but no underlying views are checked

**Definition:** mysqlx_crud.proto:365

[LOAD](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#a0b674752cca6d434a1a69f40877eb2be)

#define LOAD

**Definition:** sql_yacc.h:1179

[INTO](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8aab0fb930b459cfb52c8929bc8f048c4f)

@ INTO

**Definition:** sql_yacc.h:299

[TABLE](https://dev.mysql.com/doc/dev/mysql-server/latest/structTABLE.html)

**Definition:** table.h:1456

The `LOCAL` keyword triggers the server to set a `LOCAL INFILE` request packet which asks the client to send the file via a [LOCAL INFILE Data](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_local_infile_data.html) response

The client has to send the CLIENT_LOCAL_FILES capability flag.

Returns
    [LOCAL INFILE Data](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_local_infile_data.html)
| Type | Name | Description |
| --- | --- | --- |
| int<1> | packet type | 0xFB: LOCAL INFILE |
| string<EOF> | filename | the path to the file the client shall send | 

Example
    

0c 00 00 01 fb 2f 65 74 63 2f 70 61 73 73 77 64 ...../etc/passwd

See also
    handle_local_infile, mysql_set_local_infile_handler, net_request_file, Sql_cmd_load_table::execute_inner
