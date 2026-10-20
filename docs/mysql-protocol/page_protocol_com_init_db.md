# COM_INIT_DB

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_init_db.html>

Change the default schema of the connection

Returns
    

  * [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) on success
  * [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) on error

| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x02: COM_INIT_DB |
| string<EOF> | schema name | name of the schema to change to | 

Example
    

05 00 00 00 02 74 65 73 74 .....test
