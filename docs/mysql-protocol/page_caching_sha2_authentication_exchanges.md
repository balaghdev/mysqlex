# Caching_sha2_password information

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_caching_sha2_authentication_exchanges.html>

#  Definition  
  
  * The server side plugin name is _caching_sha2_password_
  * The client side plugin name is _caching_sha2_password_
  * Account - user account (user-host combination) 
  * authentication_string - Transformation of account password stored in mysql.user table 
  * user_password - Password known to generate authentication_string for given user account 
  * client_password - password used by client while connecting to server 
  * Nonce - 20 byte long random data 
  * Scramble - XOR(SHA256(password), SHA256(SHA256(SHA256(password)), Nonce)) 
  * Hash entry - account_name -> SHA256(SHA256(user_password)) 

#  How caching_sha2_password works?

Plugin caching_sha2_password works in two phases.

  1. Fast authentication
  2. Complete authentication

If server has cached hash entry for given user in memory, it uses scramble sent by client to perform fast authentication. If it is a success, authentication is done and connection will move to command phase. If there is an error, server will signal client to switch to full authentication that involves sending password over a secure connection server. Server then verifies password against authentication_string for given user account. If it is a success, server caches hash entry for the account and connection enters command phase. If there is an error, server sends error information to client and connection is terminated.

Following section describes state transitions and message exchanges between server and client.

Note that there are additional sanity checks performed by server and client at various steps. Such steps may result into end of communication by either party. However, such sanity checks are not covered in the diagram below.

Legends
