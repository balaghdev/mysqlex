# String Types

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_strings.html>

Strings are sequences of bytes and appear in a few forms in the protocol.

#  Protocol::FixedLengthString

Fixed-length strings have a known, hardcoded length.

An example is the sql-state of the [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) which is always 5 bytes long.

#  Protocol::NullTerminatedString

Strings that are terminated by a `00` byte.

#  Protocol::VariableLengthString

The length of the string is determined by another field or is calculated at runtime

#  Protocol::LengthEncodedString

A length encoded string is a string that is prefixed with length encoded integer describing the length of the string.

It is a special case of [Protocol::VariableLengthString](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_dt_strings.html#sect_protocol_basic_dt_string_var)

#  Protocol::RestOfPacketString

If a string is the last component of a packet, its length can be calculated from the overall packet length minus the current position.
