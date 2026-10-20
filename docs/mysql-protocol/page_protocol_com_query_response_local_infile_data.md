# LOCAL INFILE Data

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query_response_local_infile_data.html>

If the client has data to send, it sends in one or more non-empty packets AS IS followed by a empty packet.

If the file is empty or there is a error while reading the file only the empty packet is sent.

| Type | Name | Description |
| --- | --- | --- |
| string<EOF> | file content | raw file data | 

See also
    handle_local_infile, mysql_set_local_infile_handler, net_request_file, Sql_cmd_load_table::execute_inner
