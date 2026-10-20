# authentication_webauthn information

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_webauthn_authentication_exchanges.html>

page_webauthn_authentication_exchanges

#  Definition

  * The server side plugin name is _authentication_webauthn_
  * The client side plugin name is _authentication_webauthn_client_
  * Account - user account (user-host combination) 
  * authentication_string - Transformation of Credential ID stored in mysql.user table 
  * relying party ID - Unique name assigned to server by authentication_webauthn plugin 
  * FIDO authenticator - A hardware token device 
  * Salt - 32 byte long random data 
  * Registration mode - Refers to state of connection where only ALTER USER is allowed to do registration steps. 

#  How authentication_webauthn works?

Plugin authentication_webauthn works in two phases. 

  * Registration of hardware token device 
  * Authentication process 

Registration process: This is a 2 step process for a given user account. 

  * Initiate registration step. 
  * Finish registration step. 

Initiate registration: -register-factor mysql client option initiates registration step.

  1. Client executes ALTER USER user() nth FACTOR INITIATE REGISTRATION; 
  2. Server sends a challenge comprising of 1 byte capability bit, 32 bytes random salt, relying party ID Format of challenge is: 

     * 1 byte capability 
     * length encoded 32 bytes random salt 
     * length encoded relying party ID 
     * length encoded user id (`user name`@`host name`) 

Server also sends name of the client plugin - In this case authentication_webauthn_client. 

  3. Client receives challenge and client plugin name. It then passes challenge to authentication_webauthn_client plugin with option "registration_challenge" using mysql_plugin_options() 
  4. FIDO authenticator may prompt to enter device pin. By default pin can be provided via standard input. Alternatively, register a callback with option "authentication_webauthn_client_callback_get_password" using mysql_plugin_options() to provide pin. FIDO authenticator prompts to perform gesture action. This message can be accessed via callback. Register a callback with option "authentication_webauthn_client_messages_callback" using mysql_plugin_options() 
  5. Once gesture action (touching the token) is performed, FIDO authenticator generates a public/private key pair, a credential attestation statement ( X.509 certificate, signature) and authenticator data. 
  6. Client extracts registration response(aka challenge response) from authentication_webauthn_client plugin with option "registration_response" using mysql_plugin_get_option() Response is encoded in base64. Format of challenge response is: 
     * 1 bytes capability 
     * length encoded authenticator data 
     * length encoded signature 
     * length encoded x509 certificate 
     * length encoded Client data JSON 
     * length encoded full credential attestation statement CBOR, if capability has the SEND_FULL_ATTESTATION_BLOB on 
     * length encoded algoritm used for the authentication data, if capability has the SEND_FULL_ATTESTATION_BLOB on 

Finish registration: 

  1. Client executes ALTER USER user() nth FACTOR FINISH REGISTRATION SET CHALLENGE_RESPONSE AS '?'; parameter is binded to challenge response received during initiate registration step. 
  2. authentication_webauthn plugin verifies the challenge response and responds with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) or rejects with [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)

Authentication process: Once initial authentication methods defined for user account are successful, server initiates webauthn authentication process. This includes following steps: 

  1. Server sends a 32 byte random salt, relying party ID to client. Format is: 
     * 1 byte capability 
     * length encoded 32 byte random salt 
     * length encoded relying party ID 
  2. Client receives them and checks if FIDO device has CTAP2(aka fido2) capability. 
  3. If FIDO device is not capable of CTAP2, client requests server to send credential ID. Format is: | 0x01 | 
  4. Server sends credential ID (or empty string if unavailable) to client. Format is: | length encoded credential ID | 
  5. If device has CTAP2 capability and if user has configured preserve-privacy option, client prompts user to enter pin. client then retrieves all credentials for given relying party ID from FIDO authenticator. 
  6. Client prompts user to choose from the list of credentials. 
  7. Client sends random salt, relying party ID and optionally credential ID OR resident key identifier to FIDO authenticator. 
  8. FIDO authenticator prompts to perform gesture action. 
  9. For CTAP2 capable device, FIDO authenticator extracts one (in case of preserve-privacy option) or all private key based on relying party ID and signs the challenge. 
  10. For non-CTAP2 devices, FIDO authenticator extracts private key based on relying party ID and credential ID received from server and signs the challenge. 
  11. Client sends signed challenge to server. Format: 
     * 0x02 
     * length encoded number of assertions 
     * length encoded authenticator data 
     * length encoded signature, ... 
     * length encoded authenticator data 
     * length encoded signature 
     * client data json 
  12. Server side webauthn authentication plugin verifies the signature with the public key and responds with an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) or with [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html)

#  Packet Information

##  Packets related to registration

When client sends ALTER USER <username> <N> FACTOR INITIATE REGISTRATION and if user is using authentication_webauthn for given factor, server response will contain registration challege received from server plugin. Following is the format of such a challenge.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | capability flags | Can be a combination of RESIDENT_KEYS(0x01) and SEND_FULL_ATTESTATION_BLOB(0x02) |
| string[32] | random data | 32 bytes random string |
| string[<var>] | Relying Party ID | Variable length Relying Party ID set by authentication_webauthn_rp_id |
| string[<var>] | Username | Variable length username information | 

In response to registration challenge, client plugin calculates response and sends it to server as a part of ALTER USER <username> <N> FACTOR FINISH REGISTRATION

| Type | Name | Description |
| --- | --- | --- |
| int<1> | capability flags | Can be a combination of RESIDENT_KEYS(0x01) and SEND_FULL_ATTESTATION_BLOB(0x02) |
| string[32] | authenticator data | length encoded challenge response received as a part of FIDO registration. Not used if attestation blob is sent |
| string[<var>] | X509 Certificate | length encoded X509 certificate received as a part of FIDO registration. Not used if attestation blob is sent |
| string[<var>] | ClientDataJSON | length encoded client data JSON used for calculating response |
| if capabilities & SEND_FULL_ATTESTATION_BLOB { |  |  |
| string[<var>] | Attestation blob | length encoded CBOR formatted attestation statenment blob serialization |
| string[<var>] | authentication data format | length encoded format name string. Can be packed, fido-u2f, tpm or none |
| } // SEND_FULL_ATTESTATION_BLOB |  |  | 

##  Packets related to authentication

As a part of [Protocol::AuthNextFactor:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_next_factor_request.html), server plugin sends following information to client.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | 0x01 | capability |
| string[32] | random data | 32 bytes random string |
| string[<var>] | Relying Party ID | Variable length Relying Party ID set by authentication_webauthn_rp_id | 

If client plugin detects that FIDO device is not capable of CTAP2, it requests server plugin for the same using following.

| Type | Name | Description |
| --- | --- | --- |
| int<1> | 0x01 (1) | Credential ID request packet | 

When server plugin receive request for credential ID, it sends it in following format.

| Type | Name | Description |
| --- | --- | --- |
| string[<var>] | credential data | Variable length credential ID | 

Client plugin sends final authentication reply in following format

| Type | Name | Description |
| --- | --- | --- |
| int<1> | 0x02 (1) | Assertion information |
| int<lenenc> | number_of_assertions | length encoded number of assertions |
| if number_of_assertions > 0, for each { |  |  |
| string[<var>] | authenticator data | Variable length authdata obtained as a part of FIDO assertion |
| string[<var>] | authenticator data | Variable length signed challenge obtained as a part of FIDO assertion |
| } |  |  |
| string[<var>] | Clientdata JSON | Variable length JSON client data used for assertion |
