# Protocol::AuthMoreData:

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_more_data.html>

We need to make sure that when sending plugin supplied data to the client they are not considered a special out-of-band command, like e.g.

[ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html), [Protocol::AuthSwitchRequest:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_request.html) or [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html). To avoid this the server will send all plugin data packets "wrapped" in a command \1. Note that the client will continue sending its replies unrwapped: [Protocol::AuthSwitchResponse:](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase_packets_protocol_auth_switch_response.html)

| Type | Name | Description |
| --- | --- | --- |
| int<1> | 0x01 | status tag |
| string<EOF> | authentication method data | Extra authentication data beyond the initial challenge | 

See also
    wrap_plguin_data_into_proper_command, server_mpvio_write_packet, client_mpvio_read_packet
