# Command Phase

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase.html>

In the command phase, the client sends a command packet with the sequence-id [00]:

13 00 00 00 03 53 ...

01 00 00 00 01

^^- command-byte

^^---- [sequence](https://dev.mysql.com/doc/dev/mysql-server/latest/udf__example_8cc.html#aa48a6c218d5a51dadae7378c4e83c109)-id == 0

[sequence](https://dev.mysql.com/doc/dev/mysql-server/latest/udf__example_8cc.html#aa48a6c218d5a51dadae7378c4e83c109)

long long sequence(UDF_INIT *initid, UDF_ARGS *args, unsigned char *, unsigned char *)

**Definition:** udf_example.cc:568

The first byte of the payload describes the command-type. See enum_server_command for the list of commands supported.

The commands belong to one of the following sub-protocols

  * [Text Protocol](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_text.html)
  * [Utility Commands](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_utility.html)
  * [Prepared Statements](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_ps.html)
  * [Stored Programs](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_sp.html)

See also
    dispatch_command
