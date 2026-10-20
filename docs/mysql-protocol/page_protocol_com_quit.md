# COM_QUIT

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_quit.html>

Tells the server that the client wants it to close the connection.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x01: COM_QUIT | 

Server closes the connection or returns [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html).
