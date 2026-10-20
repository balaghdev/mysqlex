# Connection Lifecycle

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_lifecycle.html>

The MySQL protocol is a stateful protocol.

When a connection is established the server initiates a [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html). Once that is performed the connection enters the [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html). The [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html) ends when the connection terminates.

The connection can also enter [Replication Protocol](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html) from [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html) if one of the replication commands is sent.

Further reading:

  * [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html)
  * [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html)
  * [Replication Protocol](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_replication.html)
