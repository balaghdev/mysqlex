# Authentication Methods

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods.html>

To authenticate a user against the server the client server protocol employs one of several authentication methods.

As of MySQL 5.5 the authentication method to be used to authenticate connections to a particular MySQL account is indicated in the mysql.user table. For earlier servers it's always mysql native authentication or old password authentication depending on the [CLIENT_SECURE_CONNECTION](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933) flag.

Client and server negotiate what types of authentication they support as part of the [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html) and [Determining Authentication Method](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html#sect_protocol_connection_phase_initial_handshake_auth_method).

Each authentication method consists of a client plugin name a server plugin name a specific exchange

The exchanged input and output data may either be sent as part of the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) and the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) or as a part of the [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) and following packets. The structure is usually the same.

#  Limitations

While the overall exchange of data is free-form there are some limitations in the initial handshake of the amount of data that can be exchanged without causing an extra round trip:

  * The `auth_plugin_data` field in [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) packet can only carry 255 bytes max (see [CLIENT_SECURE_CONNECTION](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933)). 
  * The `auth_reponse_data` field in [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html) packet can only carry 255 bytes max too if [CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gac2afd7c695ae50763b5c1b7320e812d3) is not set. 
  * The client-side plugin may not receive its initial data in the initial handshake 

#  Old Password Authentication

Authentication::Old:

  * The server name is _mysql_old_password_
  * The client name is _mysql_old_password_
  * Client side requires an 8-byte random challenge from server 
  * Client side sends a 8 byte response packet based on a proprietary algorithm. 

Note
    If the server announces mysql_native_password in the [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) packet the client may use the first 8 bytes of its 20-byte auth_plugin_data as input.

Warning
    The hashing algorithm used for this auth method is _broken_ as shown in CVE-2000-0981.

[Caching_sha2_password information](https://dev.mysql.com/doc/dev/mysql-server/latest/page_caching_sha2_authentication_exchanges.html) [Clear text client plugin](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_clear_text_password.html) [Windows Native Authentication](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_authentication_windows.html) [authentication_webauthn information](https://dev.mysql.com/doc/dev/mysql-server/latest/page_webauthn_authentication_exchanges.html)
