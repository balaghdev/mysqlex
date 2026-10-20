# Clear text client plugin

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_clear_text_password.html>

* This client side plugin is used by a number of server plugins: LDAP (_authentication_ldap_simple_) and PAM (_authentication_pam_) to name a few. 
  * The client name is _mysql_clear_password_
  * Client side requires nothing from the server. But the server generates and sends a 20-byte mysql_native_password compatible scramble. 
  * Client side sends the password in clear text to the server 

Note
    Sending the scramble is not necessary for the clear text method, but, since the server always initiates the exchange by sending [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) and that one has a placeholder for authentication plugin dependent data the server does fill that space with a scramble should it come to pass that it will back down to mysql_native_password. This is also why it's OK no to specifically read this in [clear_password_auth_client](https://dev.mysql.com/doc/dev/mysql-server/latest/sql-common_2client_8cc.html#a3709a53d7f1d422390de417fd43e83cb) since it's already read as a part of the initial exchange.

See also
    clear_password_auth_client, server_mpvio_write_packet, send_server_handshake_packet
