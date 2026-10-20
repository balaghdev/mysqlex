# Stored Programs

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_sp.html>

In MySQL 5.0 the protocol was extended to handle:

  * [Multi-Resultset](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_sp.html#sect_protocol_command_phase_sp_multi_resultset)
  * [Multi-Statement](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_command_phase_sp.html#sect_protocol_command_phase_sp_multi_statement)

#  Multi-Resultset

Multi-resultsets are sent by a stored program if more than one resultset was generated inside of it. e.g.: 

[CREATE](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a473b49382a20dcc5b0ee10ddbc6338b4) [TEMPORARY](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a53f28ed69876a83aa787857961d5d217) [TABLE](https://dev.mysql.com/doc/dev/mysql-server/latest/structTABLE.html) ins ( id INT );

[DROP](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a8b0b0025af76a3d8f0b7b1d4758e51a6) [PROCEDURE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__GROUP__PARSER.html#gga9e3ffdbaa8d88485570eaf514d3808e5a6c4d52355c694ee12dcd648562757f52) [IF](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a252802eda493fb6b4a279c4452acb547) [EXISTS](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a3197625a1bb2264943f5a95f236d9973) multi;

[DELIMITER](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacesha2__password.html#a2b7ae221fe6038a37dd6ddd50c32478d) $$

[CREATE](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a473b49382a20dcc5b0ee10ddbc6338b4) [PROCEDURE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__GROUP__PARSER.html#gga9e3ffdbaa8d88485570eaf514d3808e5a6c4d52355c694ee12dcd648562757f52) multi() [BEGIN](https://dev.mysql.com/doc/dev/mysql-server/latest/lexyy_8cc.html#ab766bbbee08d04b67e3fe599d6900873)

[SELECT](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceconsts.html#ae42e6bb9561cb112c8df234e2d9ed34a) 1;

[SELECT](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceconsts.html#ae42e6bb9561cb112c8df234e2d9ed34a) 1;

INSERT [INTO](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8aab0fb930b459cfb52c8929bc8f048c4f) ins [VALUES](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a91a9a6a83761d5dd2b34344be9dc8000) (1);

INSERT [INTO](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8aab0fb930b459cfb52c8929bc8f048c4f) ins [VALUES](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a91a9a6a83761d5dd2b34344be9dc8000) (2);

END$$

[DELIMITER](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacesha2__password.html#a2b7ae221fe6038a37dd6ddd50c32478d) ;

CALL multi();

[DROP](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a8b0b0025af76a3d8f0b7b1d4758e51a6) [TABLE](https://dev.mysql.com/doc/dev/mysql-server/latest/structTABLE.html) ins;

[enum_sp_type::PROCEDURE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__GROUP__PARSER.html#gga9e3ffdbaa8d88485570eaf514d3808e5a6c4d52355c694ee12dcd648562757f52)

@ PROCEDURE

[BEGIN](https://dev.mysql.com/doc/dev/mysql-server/latest/lexyy_8cc.html#ab766bbbee08d04b67e3fe599d6900873)

#define BEGIN

**Definition:** lexyy.cc:128

[consts::SELECT](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceconsts.html#ae42e6bb9561cb112c8df234e2d9ed34a)

const std::string SELECT("SELECT")

Name of the static privileges.

[sha2_password::DELIMITER](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacesha2__password.html#a2b7ae221fe6038a37dd6ddd50c32478d)

const char DELIMITER

**Definition:** i_sha2_password.h:75

[IF](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a252802eda493fb6b4a279c4452acb547)

@ IF

**Definition:** sql_yacc.h:283

[EXISTS](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a3197625a1bb2264943f5a95f236d9973)

@ EXISTS

**Definition:** sql_yacc.h:224

[CREATE](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a473b49382a20dcc5b0ee10ddbc6338b4)

@ CREATE

**Definition:** sql_yacc.h:152

[TEMPORARY](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a53f28ed69876a83aa787857961d5d217)

@ TEMPORARY

**Definition:** sql_yacc.h:621

[DROP](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a8b0b0025af76a3d8f0b7b1d4758e51a6)

@ DROP

**Definition:** sql_yacc.h:197

[VALUES](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8a91a9a6a83761d5dd2b34344be9dc8000)

@ VALUES

**Definition:** sql_yacc.h:672

[INTO](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#ab3993f81186c462a6efd123868e2f5a8aab0fb930b459cfb52c8929bc8f048c4f)

@ INTO

**Definition:** sql_yacc.h:299

[TABLE](https://dev.mysql.com/doc/dev/mysql-server/latest/structTABLE.html)

**Definition:** table.h:1456

results in:

  * a resultset 

01 00 00 01 01 17 00 00 02 03 64 65 66 00 00 00 ..........def...

01 31 00 0c 3f 00 01 00 00 00 08 81 00 00 00 00 .1..?...........

05 00 00 03 fe 00 00 0a 00 02 00 00 04 01 31 05 ..............1.

00 00 05 fe 00 00 0a 00 ........

    * see the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) `05 00 00 03 fe 00 00 0a 00` with its status-flag being `0x0A`
  * another resultset: 

01 00 00 06 01 17 00 00 07 03 64 65 66 00 00 00 ..........def...

01 31 00 0c 3f 00 01 00 00 00 08 81 00 00 00 00 .1..?...........

05 00 00 08 fe 00 00 0a 00 02 00 00 09 01 31 05 ..............1.

00 00 0a fe 00 00 0a 00 ........

    * see the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) `05 00 00 03 fe 00 00 0a 00` with its status-flag being `0x0A`
  * and a closing empty resultset, an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html)

07 00 00 0b 00 01 00 02 00 00 00 ...........

If the SERVER_MORE_RESULTS_EXISTS flag ise set, that indicates more resultsets will follow.

The trailing [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) is the response to the `CALL` statement and contains the `affected_rows` count of the last statement. In our case we inserted 2 rows, but only the `affected_rows` of the last `INSERT` statement is returned as part of the [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html). If the last statement is a `SELECT`, the `affected_rows` count is 0.

As of MySQL 5.7.5, the resultset is followed by an [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html), and this [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) has the SERVER_MORE_RESULTS_EXISTS flag set to start the processing of the next resultset.

The client has to announce that it wants multi-resultsets by either setting the CLIENT_MULTI_RESULTS or CLIENT_PS_MULTI_RESULTS capability flags.

##  OUT Parameter Set

Starting with MySQL 5.5.3, prepared statements can bind OUT parameters of stored procedures. They are returned as an extra resultset in the multi-resultset response. The client announces it can handle OUT parameters by setting the CLIENT_PS_MULTI_RESULTS capability.

To distinguish a normal resultset from an OUT parameter set, the [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) or (if CLIENT_DEPRECATE_EOF capability flag is set) [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) that follows its field definition has the SERVER_PS_OUT_PARAMS flag set.

Note
    The closing [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) does NOT have either SERVER_PS_OUT_PARAMS flag nor the SERVER_MORE_RESULTS_EXISTS flag set. Only the first [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html) has.

#  Multi-Statement

A multi-statement is permitting COM_QUERY to send more than one query to the server, separated by `;` characters.

The client musst announce that it wants multi-statements by either setting the CLIENT_MULTI_STATEMENTS capability or by using [COM_SET_OPTION](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_com_set_option.html)
