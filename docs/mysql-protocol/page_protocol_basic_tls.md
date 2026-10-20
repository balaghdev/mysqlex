# TLS

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_tls.html>

The MySQL Protocol also supports encryption and authentication via TLS.

The encryption is transparent to the rest of the protocol and is applied after the data is compressed right before the data is written to the network layer.

The TLS support is announced in [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) sent by the server via CLIENT_SSL and is enabled if the client returns the same capability.

For an unencrypted connection the server starts with its [Protocol::Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake.html) :

36 00 00 00 0a 35 2e 35 2e 32 2d 6d 32 00 52 00 6....5.5.2-m2.R.

00 00 22 3d 4e 50 29 75 39 56 00 ff ff 08 02 00 .."=NP)u9V......

00 00 00 00 00 00 00 00 00 00 00 00 00 29 64 40 .............)d@

52 5c 55 78 7a 7c 21 29 4b 00 R\Uxz|!)K.

... and the client returns its [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)

3a 00 00 01 05 a6 03 00 00 00 00 01 08 00 00 00 :...............

00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................

00 00 00 00 72 6f 6f 74 00 14 14 63 6b 70 99 8a ....root...ckp..

b6 9e 96 87 a2 30 9a 40 67 2b 83 38 85 4b .....0.@g+.8.K

If client wants to do TLS and the server supports it, it would send a [Protocol::SSLRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_ssl_request.html) with CLIENT_SSL capability enabled.

20 00 00 01 05 ae 03 00 00 00 00 01 08 00 00 00 ...............

00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................

00 00 00 00 ....

Then the rest of the communication is switched to TLS: 

16 03 01 00 5e 01 00 00 5a 03 01 4c a3 49 2e 7a ....^...Z..[L](https://dev.mysql.com/doc/dev/mysql-server/latest/ctype-tis620_8cc.html#aa73214aa5f2f94f63d90bb4e3d99fe53).I.z

b5 06 75 68 5c 30 36 73 f1 82 79 70 58 4c 64 bb ..uh\06s..ypXLd.

47 7e 90 cd 9b 30 c5 66 65 da 35 00 00 2c 00 39 G~...0.fe.5..,.9

00 38 00 35 00 16 00 13 00 0a 00 33 00 32 00 2f .8.5.......3.2./

00 9a 00 99 00 96 00 05 00 04 00 15 00 12 00 09 ................

00 14 00 11 00 08 00 06 00 03 02 01 00 00 04 00 ................

23 00 00 #..

[L](https://dev.mysql.com/doc/dev/mysql-server/latest/ctype-tis620_8cc.html#aa73214aa5f2f94f63d90bb4e3d99fe53)

#define L

**Definition:** ctype-tis620.cc:74

The preceding packet is from SSL_connect() which does the [TLS handshake](https://en.wikipedia.org/wiki/Transport_Layer_Security#TLS_handshake)

Once the TLS tunnel is established the normal communication continues starting with the client sending the [Protocol::HandshakeResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_handshake_response.html)

See [SSL Handshake](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html#sect_protocol_connection_phase_initial_handshake_ssl_handshake) for a diagram of the exchange.

See also
    cli_establish_ssl, parse_client_handshake_packet
