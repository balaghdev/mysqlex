# Windows Native Authentication

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_authentication_windows.html>

Authentication::WindowsAuth:

  * The server name is _authentication_windows_
  * The client name is _authentication_windows_client_

The Windows Native Authentication method is more complex than the other methods and extends the auth protocol as it has to send more data forth and back than the old handshake permitted.

Basically it wraps the output of the [Negotiate SSP]("http://msdn.microsoft.com/en-us/library/windows/desktop/aa378748(v=VS.85).aspx") in the Auth Phase protocol which either means [NTLM](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_authentication_windows.html#sect_protocol_connection_phase_authentication_methods_authentication_windows_ntlm) or [SPNEGO](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_authentication_windows.html#sect_protocol_connection_phase_authentication_methods_authentication_windows_spnego) are used as underlying protocol.

Due to the implementation details the Windows Native Authentication method doesn't use the fast path of the [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html), but is only triggered on request as part of the [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) packet.

Note
    Due to implementation details (again) the first packet sent from the client to the server is expected to be either 

  * 254 bytes long max or 
  * send the first 254 bytes first, appended by 1 byte with a magic value plus a 2nd packet with rest of the data

Also following windows authentication packets don't get split.

The client will send either a [SPNEGO](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_authentication_windows.html#sect_protocol_connection_phase_authentication_methods_authentication_windows_spnego) or a [NTLM](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_authentication_methods_authentication_windows.html#sect_protocol_connection_phase_authentication_methods_authentication_windows_ntlm) packet as a next packet.

To implement the protocol one can use several existing implementations: 

  * MS Windows provides [InitializeSecurityContextW](http://msdn.microsoft.com/en-us/library/windows/desktop/aa375509\(v=VS.85\).aspx) and [AcceptSecurityContext](http://msdn.microsoft.com/en-us/library/aa374703.aspx)
  * A open source implementation of NTML, SPNEGO and Kerberos5 are provided by [Heimdal](http://www.h5l.org/)
  * Java6 added SPNEGO support to [JGSS](http://download.oracle.com/javase/6/docs/technotes/guides/security/jgss/lab/part5.html#SPNEGO) which also provides the NTLM and Kerberos5 support. 

See also
    win_auth_handshake_client

#  NTLM

Note
    [Removed in Windows Vista and 2008](http://msdn.microsoft.com/en-us/library/aa480152.aspx#appcomp_topic16)
     Documented in [MSDN](https://msdn.microsoft.com/en-us/library/cc207842.aspx)

#  SPNEGO

Uses GSS-API as protocol and negotiates the proper auth-method automatically. 

Tip
    To decode these packets by hand you need to read: 

  * [RFC2473](http://tools.ietf.org/html/rfc2743.html#page-81) Section 3.1: Mechanism-independent Token Format 
  * [RFC4178](http://tools.ietf.org/html/rfc4178.html#page-7) Section 4: Token Definitions 
  * [X.680](http://www.itu.int/ITU-T/studygroups/com17/languages/X.680-0207.pdf) ASN.1 
  * [X.690](http://www.itu.int/ITU-T/studygroups/com17/languages/X.690-0207.pdf) DER
