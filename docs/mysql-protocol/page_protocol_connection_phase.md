# Connection Phase

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html>

The Connection Phase performs these tasks:

  * exchange the capabilities of client and server
  * setup SSL communication channel if requested
  * authenticate the client against the server

It starts with the client connect()ing to the server which may send a ERR packet and finish the handshake or send a Initial Handshake Packet which the client answers with a Handshake Response Packet. At this stage client can request SSL connection, in which case an SSL communication channel is established before client sends its authentication response.

Note
    In case the server sent a ERR packet as first packet it will happen before the client and server negotiated any capabilities. Therefore the ERR packet will not contain the SQL-state.

After initial handshake, server informs client about the method to be used for authentication (unless it was already established during the handshake) and the authentication exchange continues until server either accepts connection by sending an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) or rejects it with [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html).

#  Initial Handshake

The initial handshake starts with the server sending the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) packet. After this, optionally, the client can request an SSL connection to be established with the [Protocol::SSLRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_ssl_request.html) packet and then the client sends the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) packet.

##  Plain Handshake

  1. Server sending [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html).
  2. Client replying with [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)

##  SSL Handshake

  1. Server sending [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html)
  2. Client replying with [Protocol::SSLRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_ssl_request.html)
  3. The usual SSL exchange leading to establishing SSL connection
  4. Client sends [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)

##  Capability Negotiation

To permit an old client to connect to newer servers, the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) contains

the MySQL Server version the server's [Capabilities Flags](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html)

The client should only announce the capabilities in the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) that it has in common with the server.

They can agree on: use of [status flags](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga536a91524dc8d56bcac63aadc8811f1d) use of [SQL states for error codes](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gacde6ac915ca4c7bc88ae19d7dd9a04c4) [authentication methods](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html#sect_protocol_connection_phase_initial_handshake_auth_method) [SSL Support](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaa7b23d0f15fbcd6f975df1d6204ea5a2) [Compression](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga69668fa642cd688ab5a3c24de87c0b9a)

##  Determining Authentication Method

Method used for authentication is tied to the user account and stored in the plugin column of mysql.user table. Client informs about the user account it wants to log into in the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) packet. Only then server can look up the mysql.user table and find the authentication method to be used.

However, to save round-trips, server and client start authentication exchange already in the initial handshake using an optimistic guess of the authentication method to be used.

Server uses its default authentication method defined by [authentication_policy](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceauthentication__policy.html) to produce initial authentication data payload and sends it to the client inside [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html), together with the name of the method used.

Client can include in the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) packet its reply to the authentication data sent by the server.

When including authentication reply in the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html), client is not obligated to use the same authentication method that was used by the server in the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) packet. The name of the authentication method used by the client is stored in the packet. If the guessed authentication method used either by the client or the server in the initial handshake was not correct, server informs client which authentication method should be used using [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html). See section [Authentication Method Mismatch](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html#sect_protocol_connection_phase_auth_method_mismatch) for more details.

Up to MySQL 4.0 the MySQL protocol only supported the [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication). In MySQL 4.1 the mysql_native_password method was added and in MySQL 5.5 arbitrtary authentication methods can be implemented by means of authentication plugins.

In MySQL 9.0 the mysql_native_password was removed from server code. For compatibility reasons it is still present at client side, but it is converted from built-in into shared form.

If the client or server do no support pluggable authentication (i.e. [CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) capability flag is not set) then authentication method used is inherited from client and server capabilities as follows: The method used is [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) if [CLIENT_PROTOCOL_41](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gacde6ac915ca4c7bc88ae19d7dd9a04c4) or [CLIENT_SECURE_CONNECTION](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933) are not set. The method used is mysql_native_password if both [CLIENT_PROTOCOL_41](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gacde6ac915ca4c7bc88ae19d7dd9a04c4) and [CLIENT_SECURE_CONNECTION](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933) are set, but [CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) is not set.

#  Authentication Phase Fast Path

Assume the client wants to log in via user account U and that user account is defined to use authentication method `server_method`. The fast authentication path is used when: 

  * the server used `server_method` to generate authentication data in the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) packet. 
  * the client used a `client_authentication_method` in [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) that is compatible with the `server_method` used by the server. 

In that case the first round of authentication has been already commenced during the handshake. Now, depending on the authentication method `server_method`, further authentication can be exchanged until the server either accepts or refuses the authentication.

##  Successful Authentication

A successful fast authentication path looks as follows:

  1. The client connects to the server
  2. The server sends [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html)
  3. The client responds with [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)
  4. Client and server possibly exchange further packets as required by the server authentication method for the user account the client is trying to authenticate against.
  5. The server responds with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)

The packets the server sends in step 4 are a [Protocol::AuthMoreData:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_more_data.html) packet prefixed with 0x01 to distinguish them from [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) and [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)

Note
    Many authentication methods, including the mysql_native_password method consist of a single challenge-response exchange. In that case no extra packet are exchanged in step 4 and the server sends an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) directly after receiving the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) packet (provided the authentication was successful).
     In MySQL 9.0 the mysql_native_password was removed from server code. For compatibility reasons it is still present at client side, but it is converted from built-in into shared form.

##  Authentication Fails

It goes exactly like [Successful Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html#sect_protocol_connection_phase_fast_path_success), but if the server decides that it won't authenticate the user, it replies with an [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) instead of [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html).

  1. The client connects to the server
  2. The server sends [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html)
  3. The client responds with [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)
  4. Client and server possibly exchange further packets as required by the server authentication method for the user account the client is trying to authenticate against.
  5. The server responds with an [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)

Again, the [Protocol::AuthMoreData:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_more_data.html) packets sent by the server during step 4 start with 0x01 byte and thus can never be confused with the [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html).

#  Authentication Method Mismatch

Assume that client wants to log in as user U and that user account uses authentication method M. If:

  1. Server's default method used to generate authentication payload for [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) was different from M or
  2. Method used by the client to generate authentication reply in [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) was not compatible with M then there is an authentication method mismatch and authentication exchange must be restarted using the correct authentication method.

Note
    

  1. The mismatch can happen even if client and server used compatible authentication methods in the initial handshake, but the method the server used was different from the method required by the user account.
  2. In the 4.1-5.7 server and client the default authentication method is mysql_native_password
  3. In 8.0 server and client the default authentication method is [Caching_sha2_password information](https://dev.mysql.com/doc/dev/mysql-server/latest/page_caching_sha2_authentication_exchanges.html).
  4. In 9.0 server the mysql_native_password was removed from the server code. For compatibility reasons it is still present at client side, but it is converted from built-in into shared form.
  5. The client and the server can change their default authentication method via the `--default-auth` option. . A sensibe thing to do for a client would be to see the server's default authentication method announced in the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) packet and infer the authentication method from it instead of using the client default authentication method when producing [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html). But since there can be one to many server to client plugins and the clients generally do not know the mapping from server authentication methods to client authentication methods this is not implemented in the client mysql library.

If authentication method mismatch happens, server sends to client the [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) which contains the name of the client authentication method to be used and the first authentication payload generated by the new method. Client should switch to the requested authentication method and continue the exchange as dictated by that method.

If the client does not know the requested method it should disconnect.

##  Authentication Method Change

  1. The client connects to the server
  2. The server sends [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html)
  3. The client responds with [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)
  4. The server sends the [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) to tell the client that it needs to switch to a new authentication method.
  5. Client and server possibly exchange further packets as required by the server authentication method for the user account the client is trying to authenticate against.
  6. The server responds with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) or rejects with [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)

##  Insufficient Client Capabilities

Server will reject with [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) if it discovers that client capabilities are not sufficient to complete authentication. This can happen in the following situations:

  * A client which does not support pluggable authentication ([CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) flag not set) connects to an account which uses authentication method different from mysql_native_password 
  * A client which does not support secure authentication ( [CLIENT_SECURE_CONNECTION](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933) flag not set) attempts to connect. 
  * Server's default authentication method used to generate authentication data in [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) is incompatible with mysql_native_password and client does not support pluggable authentication ([CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) flag is not set). 

In either of these cases authentication phase will look as follows:

  1. The client connects to the server
  2. The server sends [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html)
  3. The client response with [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)
  4. The server recognizes that the client does not have enough capabilities to handle the required authentication method, sends [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) and closes the connection.

##  New Authentication Method Not Known by Client

Even if client supports external authentication ([CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) flag is set) the new authentication method indicated in [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) might not be known to it. In that case the client simply disconnects.

  1. The client connects to the server
  2. The server sends [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html)
  3. The client response with [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)
  4. The server sends the [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) to tell the client that it needs to switch to a new authentication method.
  5. client discovers that it does not know the authentication method requested by the server - it disconnects.

##  Non-CLIENT_PLUGIN_AUTH Clients

Note
    9.0 server no longer supports non-CLIENT_PLUGIN_AUTH Clients. Clients with no CLIENT_PLUGIN_AUTH capability are rejected.
     This can only happen on pre-8.0 servers. 8.0 has the [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) removed.
     In MySQL 9.0 the mysql_native_password was removed from server code. For compatibility reasons it is still present at client side, but it is converted from built-in into shared form.

The only situation where server will request authentication method change from a client which does not set [CLIENT_PLUGIN_AUTH](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2a6cb83350f95a382a35de3021904012) flag is when the following conditions hold:

  1. The client uses [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) for the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) packet.
  2. The client supports secure authentication ([CLIENT_SECURE_CONNECTION](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933) is set)
  3. Server's default authentication method is mysql_native_password

In this case server sends [Protocol::OldAuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_old_auth_switch_request.html). This packet does not contain a new authenticartion method name because it's implicitly assumed to be mysql_native_password and it does not contain authentication data. Client replies with [Protocol::HandshakeResponse320](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html#sect_protocol_connection_phase_packets_protocol_handshake_response320). To generate a password hash the client should re-use the random bytes sent by the server in the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html).

#  Authentication After COM_CHANGE_USER Command

During [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html) a client can send a COM_CHANGE_USER command which will trigger authenticating into a new account via a full authentication handshake.

Similarly to the [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html) the server may reply with a [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) or [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) for the usual fast-path or with [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) containing the authentication method to be used for the new account and the first authentication data payload to be consumed by the client. Further handshake continues as usual, as defined by the authentication method of the new account. Eventually the server will accept the new account with [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) or it will reject the change with an [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) and disconnect.

  1. The client sends COM_CHANGE_USER packet
  2. The server responds with the [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) which initiates authentication handshake using the correct authentication method
  3. Client and server exchange further packets as required by the authentication method for the new account
  4. The server responds with [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) and returns to command phase or [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) and closes the connection.

##  COM_CHANGE_USER and Non-CLIENT_PLUGIN_AUTH Clients

Note
    9.0 server no longer supports non-CLIENT_PLUGIN_AUTH Clients. Clients with no CLIENT_PLUGIN_AUTH capability are rejected.
     In MySQL 9.0 the mysql_native_password was removed from server code. For compatibility reasons it is still present at client side, but it is converted from built-in into shared form.

Clients which do not support pluggable authentication can send COM_CHANGE_USER command for accounts which use mysql_native_password or [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication). In this case it is assumed that server has already sent the authentication challenge - the same which was sent when the client connected for the first time - and client's reply to that challenge, i.e. the hash of the new password, should be sent in the `auth_response` field of COM_CHANGE_USER.

  1. The client sends COM_CHANGE_USER packet with authentication response (hash of the password) for mysql_native_password (post 4.1 clients) or [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) (pre 4.1 clients) method.
  2. The server responds with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) and returns to [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html) or with an [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) and closes the connection.

As during normal connection, it is also possible that a post 4.1 client which does not support pluggable authentication connects to an account which uses [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication) In that case server will send [Protocol::OldAuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_old_auth_switch_request.html) and expect the client to reply with [Protocol::HandshakeResponse320](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html#sect_protocol_connection_phase_packets_protocol_handshake_response320)

  1. The client sends COM_CHANGE_USER packet with response for mysql_native_password
  2. The server replies with [Protocol::OldAuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_old_auth_switch_request.html) (0xFE byte)
  3. The client sends response again, this time in the form required by [Old Password Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html#page_protocol_connection_phase_authentication_methods_old_password_authentication)
  4. The server responds with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) and returns to [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html) or an [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) and disconnects

See also
    group_cs_capabilities_flags 
     unknown_accounts [Connection Phase Packets](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets.html) [Authentication Methods](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html) [Multi Factor Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_multi_factor_authentication_methods.html)
