# Client/Server Protocol

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_PROTOCOL.html>

#  Overview

The MySQL protocol is used between MySQL Clients and a MySQL Server. It is implemented by:

  * Connectors (Connector/C, Connector/J, and so forth)
  * MySQL Router
  * Communication between source and replica replication servers
  * MySQL Group Replication
  * The Clone Plugin for cloning servers

The protocol supports these features:

  * Transparent encryption using TLS
  * Transparent compression
  * A [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html) where capabilities and authentication data are exchanged
  * A [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html) which accepts commands from the client and executes them

Further reading:

  * [Protocol Basics](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basics.html)
  * [Connection Lifecycle](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_lifecycle.html)
