# Multi Factor Authentication

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_multi_factor_authentication_methods.html>

Assume the client wants to log in via user account U and that user account is defined with multiple authentication methods namely X,Y,Z.

Assume default authentication method on both server and client is X.

#  Authentication

A successful authentication path looks as follows:

  1. The client connects to the server
  2. The server sends [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html)
  3. The client responds with [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)
  4. X authentication method packets are exchanged
  5. The server responds with an [Protocol::AuthNextFactor:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_next_factor_request.html) containing client side plugin name and plugin data of plugin Y.
  6. Client reads plugin name and plugin data from AuthNextFactor packet and loads corresponding client side plugin.
  7. Y authentication method packets are exchanged
  8. The server responds with an [Protocol::AuthNextFactor:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_next_factor_request.html) containing client side plugin name and plugin data of plugin Z.
  9. Client reads plugin name and plugin data from AuthNextFactor packet and loads corresponding client side plugin. 10.Z authentication method packets are exchanged 11.The server responds with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)

Note
    At any point, if the Nth Authentication Method fails, the server can return ERR and disconnect. And the client can just disconnect.
