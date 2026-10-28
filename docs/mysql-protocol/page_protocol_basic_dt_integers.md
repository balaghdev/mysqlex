# Integer Types

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html>

The MySQL Protocol has a set of possible encodings for integers.

#  Protocol::FixedLengthInteger

# Fixed-Length Integer Types 

A fixed-length unsigned integer stores its value in a series of bytes with the least significant byte first.

The MySQL uses the following fixed-length unsigned integer variants:

  * int<1>: 1 byte [Protocol::FixedLengthInteger](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#sect_protocol_basic_dt_int_fixed).
  * int<2>: 2 byte [Protocol::FixedLengthInteger](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#sect_protocol_basic_dt_int_fixed). See int2store()
  * int<3>: 3 byte [Protocol::FixedLengthInteger](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#sect_protocol_basic_dt_int_fixed). See int3store()
  * int<4>: 4 byte [Protocol::FixedLengthInteger](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#sect_protocol_basic_dt_int_fixed). See int4store()
  * int<6>: 6 byte [Protocol::FixedLengthInteger](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#sect_protocol_basic_dt_int_fixed). See int6store()
  * int<8>: 8 byte [Protocol::FixedLengthInteger](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_integers.html#sect_protocol_basic_dt_int_fixed). See int8store()

See int3store() for an example.

#  Protocol::LengthEncodedInteger

# Length-Encoded Integer Type 

An integer that consumes 1, 3, 4, or 9 bytes, depending on its numeric value

To convert a number value into a length-encoded integer:

| Greater or equal | Lower than | Stored as |
| --- | --- | --- |
| 0 | 251 | 1-byte integer |
| 251 | 2^16 | 0xFC + 2-byte integer |
| 2^16 | 2^24 | 0xFD + 3-byte integer |
| 2^24 | 2^64 | 0xFE + 8-byte integer | 

Similarly, to convert a length-encoded integer into its numeric value check the first byte.

Warning
    If the first byte of a packet is a length-encoded integer and its byte value is `0xFE`, you must check the length of the packet to verify that it has enough space for a 8-byte integer. If not, it may be an EOF_Packet instead.
