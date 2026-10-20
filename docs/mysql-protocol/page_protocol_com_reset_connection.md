# COM_RESET_CONNECTION

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_reset_connection.html>

Resets the session state

A more lightweightt version of COM_CHANGE_USER that does about the same to clean up the session state, but:

  * it does not re-authenticate (and do the extra client/server exchange for that)
  * it does not close the connection

| Type | Name | Description |
| --- | --- | --- |
| int<1> | command | 0x1F: COM_RESET_CONNECTION | 

Returns
    [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)

See also
    mysql_reset_connection, THD::cleanup_connection, dispatch_command
