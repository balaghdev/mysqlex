# Expired Password

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_expired_passwords.html>

Since MySQL 5.6.7, a MySQL account can be expired.

If a account is expired, the session is in a restricted mode which only permits SET PASSWORD = .. and similar SET commands. Other statements will fail with an error like this: 

[mysql](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacemysql.html)> [SELECT](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceconsts.html#ae42e6bb9561cb112c8df234e2d9ed34a) 1;

[ERROR](https://dev.mysql.com/doc/dev/mysql-server/latest/group__Binary__Log.html#gga1e24693cd278a03ccca7bc269375ad16a2fd6f336d08340583bd620a7f5694c90) 1820 (HY000): You must SET [PASSWORD](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#a9e8538fad4eee548302ad9f60e6d47ca) before executing this [statement](https://dev.mysql.com/doc/dev/mysql-server/latest/structstatement.html)

[ERROR](https://dev.mysql.com/doc/dev/mysql-server/latest/group__Binary__Log.html#gga1e24693cd278a03ccca7bc269375ad16a2fd6f336d08340583bd620a7f5694c90)

@ ERROR

**Definition:** binlog.cc:3832

[consts::SELECT](https://dev.mysql.com/doc/dev/mysql-server/latest/namespaceconsts.html#ae42e6bb9561cb112c8df234e2d9ed34a)

const std::string SELECT("SELECT")

Name of the static privileges.

[mysql](https://dev.mysql.com/doc/dev/mysql-server/latest/namespacemysql.html)

**Definition:** system_info_linux.cc:46

[PASSWORD](https://dev.mysql.com/doc/dev/mysql-server/latest/sql__yacc_8h.html#a9e8538fad4eee548302ad9f60e6d47ca)

#define PASSWORD

**Definition:** sql_yacc.h:1301

[statement](https://dev.mysql.com/doc/dev/mysql-server/latest/structstatement.html)

**Definition:** mysqlslap.cc:222

Not all clients can properly deal with that error. So on the protocol side exists a safeguard CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS [capability flag](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html) exists to prevent clients from entering this "sandbox" mode. Only clients that can handle this sandbox mode should report CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS on. Usually this means all interactive clients and all applications that got adjusted to handle the relevant SQL error.

If a client is not setting that capability and it tries to login with an account that has an expired password, the server will return an [ERR_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_err_packet.html) for the [Connection Phase](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_connection_phase.html) or the COM_CHANGE_USER request.

The idea is to block any activity until the password is reset.

See also
    MYSQL_OPT_CAN_HANDLE_EXPIRED_PASSWORDS, mysql_options, ACL_USER::password_expired, ACL_USER::password_lifetime, acl_authenticate
