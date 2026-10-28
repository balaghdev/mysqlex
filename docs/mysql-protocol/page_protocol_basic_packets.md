# MySQL Packets

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_packets.html>

If a MySQL client or server wants to send data, it:

  * Splits the data into packets of size 2^24 bytes
  * Prepends to each chunk a packet header

#  Protocol::Packet

Data between client and server is exchanged in packets of max 16MByte size.

| Type | Name | Description |
| --- | --- | --- |
| int<3> | payload_length | Length of the payload. The number of bytes in the packet beyond the initial 4 bytes that make up the packet header. |
| int<1> | sequence_id | Sequence ID |
| string<var> | payload | payload of the packet | 

Example:

| 01 00 00 00 01 | length: 1 sequence_id: x00 payload: 0x01 |
| --- | --- | 

See also
    my_net_write(), net_write_command(), net_write_buff(), my_net_read(), net_send_ok()

#  Sending More Than 16Mb

If the payload is larger than or equal to 2^24-1 bytes the length is set to 2^24-1 (`ff ff ff`) and a additional packets are sent with the rest of the payload until the payload of a packet is less than 2^24-1 bytes.

Sending a payload of 16 777 215 (2^24-1) bytes looks like:

ff ff ff 00 ...

00 00 00 01

#  Sequence ID

The sequence-id is incremented with each packet and may wrap around. It starts at 0 and is reset to 0 when a new command begins in the [Command Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html).

#  Describing Packets

In this document we describe each packet by first defining its payload and provide an example showing each packet that is sent, including its packet header: 
    
    
    <packetname>
      <description>
    
      direction: client -> server
      response: <response>
    
      payload:
        <type>        <description>
    

Example: 

01 00 00 00 01

Note
    Some packets have optional fields or a different layout depending on the [Capabilities Flags](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html).

If a field has a fixed value, its description shows it as a hex value in brackets like this: `[00]`
