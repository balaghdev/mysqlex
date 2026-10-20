# Capabilities Flags

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html>

Values for the capabilities flag bitmask used by the MySQL protocol. More...

| Macros |  |
| --- | --- |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  | 

## Detailed Description

Values for the capabilities flag bitmask used by the MySQL protocol. 

Currently need to fit into 32 bits.

Each bit represents an optional feature of the protocol.

Both the client and the server are sending these.

The intersection of the two determines whast optional parts of the protocol will be used. 

## Macro Definition Documentation

## ◆ CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- | 

Don't close the connection for a user account with expired password. 

## Server 

Announces support for expired password extension.

## Client 

Can handle expired passwords.

See also
    MYSQL_OPT_CAN_HANDLE_EXPIRED_PASSWORDS, disconnect_on_expired_password ACL_USER::password_expired, check_password_lifetime(), acl_authenticate() 

## ◆ CLIENT_CAPABILITY_EXTENSION

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- | 

This flag is reserved to extend the 32bit capabilities structure to 64bits. 

## ◆ CLIENT_COMPRESS

| #define CLIENT_COMPRESS 32 |
| --- | 

Compression protocol supported. 

## Server 

Supports compression.

## Client 

Switches to Compression compressed protocol after successful authentication. 

## ◆ CLIENT_CONNECT_ATTRS

| #define CLIENT_CONNECT_ATTRS (1UL << 20) |
| --- | 

Client supports connection attributes. 

## Server 

Permits connection attributes in Protocol::HandshakeResponse41.

## Client 

Sends connection attributes in Protocol::HandshakeResponse41.

See also
    send_client_connect_attrs(), read_client_connect_attrs() 

## ◆ CLIENT_CONNECT_WITH_DB

| #define CLIENT_CONNECT_WITH_DB 8 |
| --- | 

Database (schema) name can be specified on connect in Handshake Response Packet. 

## Server 

Supports schema-name in Handshake Response Packet.

## Client 

Handshake Response Packet contains a schema-name.

See also
    send_client_reply_packet() 

## ◆ CLIENT_DEPRECATE_EOF

| #define CLIENT_DEPRECATE_EOF (1UL << 24) |
| --- | 

Client no longer needs [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) and will use [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) instead. 

See also
    net_send_ok()

## Server 

Can send OK after a Text Resultset.

## Client 

Expects an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) (instead of [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html)) after the resultset rows of a Text Resultset.

## Background 

To support CLIENT_SESSION_TRACK, additional information must be sent after all successful commands. Although the [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) is extensible, the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) is not due to the overlap of its bytes with the content of the Text Resultset Row.

Therefore, the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) in the Text Resultset is replaced with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html). [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) is deprecated as of MySQL 5.7.5.

See also
    cli_safe_read_with_ok(), read_ok_ex(), net_send_ok(), net_send_eof() 

## ◆ CLIENT_FOUND_ROWS

| #define CLIENT_FOUND_ROWS 2 |
| --- | 

Send found rows instead of affected rows in [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html). 

## ◆ CLIENT_IGNORE_SIGPIPE

| #define CLIENT_IGNORE_SIGPIPE 4096 |
| --- | 

Client only flag. 

Not used.

## Client 

Do not issue SIGPIPE if network failures occur (libmysqlclient only).

See also
    mysql_real_connect() 

## ◆ CLIENT_IGNORE_SPACE

| #define CLIENT_IGNORE_SPACE 256 |
| --- | 

Ignore spaces before '('. 

## Server 

Parser can ignore spaces before '('.

## Client 

Let the parser ignore spaces before '('. 

## ◆ CLIENT_INTERACTIVE

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |0 

This is an interactive client. 

Use [System_variables::net_wait_timeout](https://dev.mysql.com/doc/dev/mysql-server/latest/structSystem__variables.html#adc4e83e42020ce5645b8accbb09ac5e3) versus [System_variables::net_interactive_timeout](https://dev.mysql.com/doc/dev/mysql-server/latest/structSystem__variables.html#ad163aab953d92e8a5ba2e2ae74eecd62).

## Server 

Supports interactive and noninteractive clients.

## Client 

Client is interactive.

See also
    mysql_real_connect() 

## ◆ CLIENT_LOCAL_FILES

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |1 

Can use LOAD DATA LOCAL. 

## Server 

Enables the LOCAL INFILE request of LOAD DATA|XML.

## Client 

Will handle LOCAL INFILE request. 

## ◆ CLIENT_LONG_FLAG

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |2 

Get all column flags. 

Longer flags in Protocol::ColumnDefinition320.

## Server 

Supports longer flags.

## Client 

Expects longer flags. 

## ◆ CLIENT_LONG_PASSWORD

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |3 

Use the improved version of Old Password Authentication. 

Not used.

Note
    Assumed to be set since 4.1.1. 

## ◆ CLIENT_MULTI_RESULTS

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |4 

Enable/disable multi-results. 

## Server 

Can send multiple resultsets for COM_QUERY. Error if the server needs to send them and client does not support them.

## Client 

Can handle multiple resultsets for COM_QUERY.

## Requires 

CLIENT_PROTOCOL_41

See also
    mysql_execute_command(), sp_head::MULTI_RESULTS 

## ◆ CLIENT_MULTI_STATEMENTS

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |5 

Enable/disable multi-stmt support. 

Also sets [CLIENT_MULTI_RESULTS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2ffea3e8918e7c9a3a2323030a2bfe0a). Currently not checked anywhere.

## Server 

Can handle multiple statements per COM_QUERY and COM_STMT_PREPARE.

## Client 

May send multiple statements per COM_QUERY and COM_STMT_PREPARE.

Note
    Was named CLIENT_MULTI_QUERIES in 4.1.0, renamed later.

## Requires 

CLIENT_PROTOCOL_41

## ◆ CLIENT_NO_SCHEMA

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |6 

DEPRECATED: Don't allow database.table.column. 

## ◆ CLIENT_ODBC

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |7 

Special handling of ODBC behavior. 

Note
    No special behavior since 3.22. 

## ◆ CLIENT_OPTIONAL_RESULTSET_METADATA

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |8 

The client can handle optional metadata information in the resultset. 

## ◆ CLIENT_PLUGIN_AUTH

| #define CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
| --- |9 

Client supports plugin authentication. 

## Server 

Sends extra data in Initial Handshake Packet and supports the pluggable authentication protocol.

## Client 

Supports authentication plugins.

## Requires 

CLIENT_PROTOCOL_41

See also
    send_change_user_packet(), send_client_reply_packet(), run_plugin_auth(), parse_com_change_user_packet(), parse_client_handshake_packet() 

## ◆ CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |0 

Enable authentication response packet to be larger than 255 bytes. 

When the ability to change default plugin require that the initial password field in the Protocol::HandshakeResponse41 paclet can be of arbitrary size. However, the 4.1 client-server protocol limits the length of the auth-data-field sent from client to server to 255 bytes. The solution is to change the type of the field to a true length encoded string and indicate the protocol change with this client capability flag.

## Server 

Understands length-encoded integer for auth response data in Protocol::HandshakeResponse41.

## Client 

Length of auth response data in Protocol::HandshakeResponse41 is a length-encoded integer.

Note
    The flag was introduced in 5.6.6, but had the wrong value.

See also
    send_client_reply_packet(), parse_client_handshake_packet(), get_56_lenc_string(), get_41_lenc_string() 

## ◆ CLIENT_PROTOCOL_41

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |1 

New 4.1 protocol. 

## Server 

Supports the 4.1 protocol.

## Client 

Uses the 4.1 protocol.

Note
    this value was CLIENT_CHANGE_USER in 3.22, unused in 4.0 

## ◆ CLIENT_PS_MULTI_RESULTS

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |2 

Multi-results and OUT parameters in PS-protocol. 

## Server 

Can send multiple resultsets for COM_STMT_EXECUTE.

## Client 

Can handle multiple resultsets for COM_STMT_EXECUTE.

## Requires 

CLIENT_PROTOCOL_41

See also
    Protocol_binary::send_out_parameters 

## ◆ CLIENT_QUERY_ATTRIBUTES

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |3 

Support optional extension for query parameters into the [COM_QUERY](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_query.html) and [COM_STMT_EXECUTE](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_stmt_execute.html) packets. 

## Server 

Expects an optional part containing the query parameter set(s). Executes the query for each set of parameters or returns an error if more than 1 set of parameters is sent and the server can't execute it.

## Client 

Can send the optional part containing the query parameter set(s). 

## ◆ CLIENT_REMEMBER_OPTIONS

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |4 

Don't reset the options after an unsuccessful connect. 

Client only flag.

Typically passed via mysql_real_connect() 's client_flag parameter.

See also
    mysql_real_connect() 

## ◆ CLIENT_RESERVED

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |5 

DEPRECATED: Old flag for 4.1 protocol   

## ◆ CLIENT_RESERVED2

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |6 

DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. 

## ◆ CLIENT_SESSION_TRACK

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |7 

Capable of handling server state change information. 

Its a hint to the server to include the state change information in [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html).

## Server 

Can set SERVER_SESSION_STATE_CHANGED in the SERVER_STATUS_flags_enum and send [Session State Information](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html#sect_protocol_basic_ok_packet_sessinfo) in a [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html).

## Client 

Expects the server to send [Session State Information](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html#sect_protocol_basic_ok_packet_sessinfo) in a [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html).

See also
    enum_session_state_type, read_ok_ex(), net_send_ok(), Session_tracker, State_tracker 

## ◆ CLIENT_SSL

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |8 

Use SSL encryption for the session. 

## Server 

Supports SSL

## Client 

Switch to SSL after sending the capability-flags. 

## ◆ CLIENT_SSL_VERIFY_SERVER_CERT

| #define CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
| --- |9 

Verify server certificate. 

Client only flag.

**[Deprecated:](https://dev.mysql.com/doc/dev/mysql-server/latest/deprecated.html#_deprecated000007)**
     in favor of -ssl-mode. 

## ◆ CLIENT_TRANSACTIONS

| #define CLIENT_COMPRESS 32 |
| --- |0 

Client knows about transactions. 

## Server 

Can send status flags in [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) / [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html).

## Client 

Expects status flags in [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) / [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html).

Note
    This flag is optional in 3.23, but always set by the server since 4.0. 

See also
    send_server_handshake_packet(), parse_client_handshake_packet(), net_send_ok(), net_send_eof() 

## ◆ CLIENT_ZSTD_COMPRESSION_ALGORITHM

| #define CLIENT_COMPRESS 32 |
| --- |1 

Compression protocol extended to support zstd compression method. 

This capability flag is used to send zstd compression level between client and server provided both client and server are enabled with this flag.

## Server 

Server sets this flag when global variable protocol-compression-algorithms has zstd in its list of supported values.

## Client 

Client sets this flag when it is configured to use zstd compression method. 

## ◆ MULTI_FACTOR_AUTHENTICATION

| #define CLIENT_COMPRESS 32 |
| --- |2 

Support Multi factor authentication. 

## Server 

Server sends AuthNextFactor packet after every nth factor authentication method succeeds, except the last factor authentication.

## Client 

Client reads AuthNextFactor packet sent by server and initiates next factor authentication method.
