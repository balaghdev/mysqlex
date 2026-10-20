# mysql_com.h File Reference

Source: <https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html>

Common definition between mysql server & client. More...

`#include <stdbool.h>`  
`#include <stdint.h>`  
`#include "[my_command.h](https://dev.mysql.com/doc/dev/mysql-server/latest/my__command_8h_source.html)"`  
`#include "[my_compress.h](https://dev.mysql.com/doc/dev/mysql-server/latest/my__compress_8h_source.html)"`  
`#include "[my_io.h](https://dev.mysql.com/doc/dev/mysql-server/latest/my__io_8h_source.html)"`  
`#include "[mysql/components/services/bits/my_io_bits.h](https://dev.mysql.com/doc/dev/mysql-server/latest/my__io__bits_8h_source.html)"`  
`#include "[mysql/udf_registration_types.h](https://dev.mysql.com/doc/dev/mysql-server/latest/udf__registration__types_8h_source.html)"`  

[Go to the source code of this file.](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h_source.html)

| Classes |  |
| --- | --- |
| struct | NET |
|  |  |
| struct | rand_struct |
|  |  | | Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  | | Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  | | Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  | | Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  | 

## Detailed Description

Common definition between mysql server & client. 

## Macro Definition Documentation

## ◆ AUTH_PLUGIN_DATA_PART_1_LENGTH

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- | 

## ◆ CAN_CLIENT_COMPRESS

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- | 

a compatibility alias for CLIENT_COMPRESS 

## ◆ CHALLENGE_LENGTH

| #define CHALLENGE_LENGTH 32 |
| --- | 

## ◆ CLIENT_ALL_FLAGS

| #define CLIENT_ALL_FLAGS |
| --- | 

**Value:**

([CLIENT_LONG_PASSWORD](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga52d3a3f2f6a84a0f427c16bd7bd3df1f) | [CLIENT_FOUND_ROWS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga4d108689643f2dfdb9d7fee3e20341af) | [CLIENT_LONG_FLAG](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gacb925b1d791ae381a1b411e26c72db35) | \

CLIENT_CONNECT_WITH_DB | [CLIENT_NO_SCHEMA](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga55c846cdcebd257a7d065c403a495767) | [CLIENT_COMPRESS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga69668fa642cd688ab5a3c24de87c0b9a) | [CLIENT_ODBC](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga790a993d52ae9454e8a3fbdfa2fc57fe) | \

CLIENT_LOCAL_FILES | [CLIENT_IGNORE_SPACE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga67c9d84d14a0858ccf9c6393c28fb6fb) | [CLIENT_PROTOCOL_41](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gacde6ac915ca4c7bc88ae19d7dd9a04c4) | \

CLIENT_INTERACTIVE | [CLIENT_SSL](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaa7b23d0f15fbcd6f975df1d6204ea5a2) | [CLIENT_IGNORE_SIGPIPE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga80b7ec30f78263f55be422853b989a28) | \

CLIENT_TRANSACTIONS | [CLIENT_RESERVED](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gad369dc5c503fc75213f86bc3ab6dd466) | [CLIENT_RESERVED2](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933) | \

CLIENT_MULTI_STATEMENTS | [CLIENT_MULTI_RESULTS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2ffea3e8918e7c9a3a2323030a2bfe0a) | [CLIENT_PS_MULTI_RESULTS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga70fe479c539d7e2970fea9a374593ea5) | \

CLIENT_SSL_VERIFY_SERVER_CERT | [CLIENT_REMEMBER_OPTIONS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga07344a4eb8f5c74ea8875bb4e9852fb0) | \

CLIENT_PLUGIN_AUTH | [CLIENT_CONNECT_ATTRS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga57c0b9235a4e8038736a776ab484b862) | \

CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA | \

CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS | [CLIENT_SESSION_TRACK](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaf33ba943944ca32827a1bce983914302) | \

CLIENT_DEPRECATE_EOF | [CLIENT_OPTIONAL_RESULTSET_METADATA](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaeb08866e8289e7ba80707a159abc1b43) | \

CLIENT_ZSTD_COMPRESSION_ALGORITHM | [CLIENT_QUERY_ATTRIBUTES](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga3cd12e9fd3901274e239881796e5219b) | \

MULTI_FACTOR_AUTHENTICATION)

[CLIENT_REMEMBER_OPTIONS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga07344a4eb8f5c74ea8875bb4e9852fb0)

#define CLIENT_REMEMBER_OPTIONS

Don't reset the options after an unsuccessful connect.

**Definition:** mysql_com.h:775

[CLIENT_MULTI_RESULTS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga2ffea3e8918e7c9a3a2323030a2bfe0a)

#define CLIENT_MULTI_RESULTS

Enable/disable multi-results.

**Definition:** mysql_com.h:516

[CLIENT_QUERY_ATTRIBUTES](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga3cd12e9fd3901274e239881796e5219b)

#define CLIENT_QUERY_ATTRIBUTES

Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets.

**Definition:** mysql_com.h:734

[CLIENT_FOUND_ROWS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga4d108689643f2dfdb9d7fee3e20341af)

#define CLIENT_FOUND_ROWS

Send found rows instead of affected rows in EOF_Packet.

**Definition:** mysql_com.h:291

[CLIENT_LONG_PASSWORD](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga52d3a3f2f6a84a0f427c16bd7bd3df1f)

#define CLIENT_LONG_PASSWORD

Use the improved version of Old Password Authentication.

**Definition:** mysql_com.h:286

[CLIENT_NO_SCHEMA](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga55c846cdcebd257a7d065c403a495767)

#define CLIENT_NO_SCHEMA

DEPRECATED: Don't allow database.table.column.

**Definition:** mysql_com.h:329

[CLIENT_CONNECT_ATTRS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga57c0b9235a4e8038736a776ab484b862)

#define CLIENT_CONNECT_ATTRS

Client supports connection attributes.

**Definition:** mysql_com.h:584

[CLIENT_IGNORE_SPACE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga67c9d84d14a0858ccf9c6393c28fb6fb)

#define CLIENT_IGNORE_SPACE

Ignore spaces before '('.

**Definition:** mysql_com.h:380

[CLIENT_COMPRESS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga69668fa642cd688ab5a3c24de87c0b9a)

#define CLIENT_COMPRESS

Compression protocol supported.

**Definition:** mysql_com.h:346

[CLIENT_PS_MULTI_RESULTS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga70fe479c539d7e2970fea9a374593ea5)

#define CLIENT_PS_MULTI_RESULTS

Multi-results and OUT parameters in PS-protocol.

**Definition:** mysql_com.h:539

[CLIENT_ODBC](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga790a993d52ae9454e8a3fbdfa2fc57fe)

#define CLIENT_ODBC

Special handling of ODBC behavior.

**Definition:** mysql_com.h:352

[CLIENT_IGNORE_SIGPIPE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga80b7ec30f78263f55be422853b989a28)

#define CLIENT_IGNORE_SIGPIPE

Client only flag.

**Definition:** mysql_com.h:444

[CLIENT_RESERVED2](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga8be684cc38eeca913698414efec06933)

#define CLIENT_RESERVED2

DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION.

**Definition:** mysql_com.h:466

[CLIENT_SSL](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaa7b23d0f15fbcd6f975df1d6204ea5a2)

#define CLIENT_SSL

Use SSL encryption for the session.

**Definition:** mysql_com.h:433

[CLIENT_LONG_FLAG](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gacb925b1d791ae381a1b411e26c72db35)

#define CLIENT_LONG_FLAG

Get all column flags.

**Definition:** mysql_com.h:309

[CLIENT_PROTOCOL_41](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gacde6ac915ca4c7bc88ae19d7dd9a04c4)

#define CLIENT_PROTOCOL_41

New 4.1 protocol.

**Definition:** mysql_com.h:398

[CLIENT_RESERVED](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gad369dc5c503fc75213f86bc3ab6dd466)

#define CLIENT_RESERVED

DEPRECATED: Old flag for 4.1 protocol

**Definition:** mysql_com.h:465

[CLIENT_OPTIONAL_RESULTSET_METADATA](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaeb08866e8289e7ba80707a159abc1b43)

#define CLIENT_OPTIONAL_RESULTSET_METADATA

The client can handle optional metadata information in the resultset.

**Definition:** mysql_com.h:697

[CLIENT_SESSION_TRACK](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaf33ba943944ca32827a1bce983914302)

#define CLIENT_SESSION_TRACK

Capable of handling server state change information.

**Definition:** mysql_com.h:658

Gather all possible capabilities (flags) supported by the client and/or server. 

## ◆ CLIENT_BASIC_FLAGS

| #define CLIENT_BASIC_FLAGS |
| --- | 

**Value:**

([CLIENT_ALL_FLAGS](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#aa6d2184e6f8c44ef31fc6eec43d60fe5) & \

~([CLIENT_SSL](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#gaa7b23d0f15fbcd6f975df1d6204ea5a2) | [CLIENT_COMPRESS](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga69668fa642cd688ab5a3c24de87c0b9a) | [CLIENT_SSL_VERIFY_SERVER_CERT](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga4e7c0220984fdf1e231344f450cfd51e) | \

CLIENT_ZSTD_COMPRESSION_ALGORITHM))

[CLIENT_SSL_VERIFY_SERVER_CERT](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga4e7c0220984fdf1e231344f450cfd51e)

#define CLIENT_SSL_VERIFY_SERVER_CERT

Verify server certificate.

**Definition:** mysql_com.h:764

[CLIENT_ALL_FLAGS](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#aa6d2184e6f8c44ef31fc6eec43d60fe5)

#define CLIENT_ALL_FLAGS

Gather all possible capabilities (flags) supported by the client and/or server.

**Definition:** mysql_com.h:783

Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. 

If any of the optional flags is supported by the build it will be switched on before sending to the client during the connection handshake. 

## ◆ CLIENT_ONLY_ALL_FLAGS

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |0 

**Value:**

([CLIENT_IGNORE_SIGPIPE](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga80b7ec30f78263f55be422853b989a28) | [CLIENT_SSL_VERIFY_SERVER_CERT](https://dev.mysql.com/doc/dev/mysql-server/latest/group__group__cs__capabilities__flags.html#ga4e7c0220984fdf1e231344f450cfd51e) | \

CLIENT_REMEMBER_OPTIONS)

Flags only supported by the client. 

## ◆ COLUMN_COMMENT_MAXLEN

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |1 

## ◆ CONNECT_STRING_MAXLEN

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |2 

## ◆ FILENAME_CHARSET_MBMAXLEN

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |3 

## ◆ FRM_GCOL_HEADER_SIZE

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |4 

The length of the header part for each generated column in the .frm file. 

## ◆ GENERATED_COLUMN_EXPRESSION_MAXLEN

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |5 

Maximum length of the expression statement defined for generated columns. 

## ◆ INDEX_COMMENT_MAXLEN

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |6 

## ◆ IS_SESSION_STATE_TYPE

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |7 

is T a valid session state type 

## ◆ LOCAL_HOST

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |8 

## ◆ LOCAL_HOST_NAMEDPIPE

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |9 

## ◆ MAX_AUTH_FACTORS

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |0 

## ◆ MAX_BIGINT_WIDTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |1 

Max width for a LONGLONG. 

## ◆ MAX_BLOB_WIDTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |2 

Default width for blob in bytes. 

## ◆ MAX_CHAR_WIDTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |3 

Max width for a CHAR column, in number of characters. 

## ◆ MAX_INT_WIDTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |4 

Max width for a LONG w.o. 

sign 

## ◆ MAX_MEDIUMINT_WIDTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |5 

Max width for a INT24 w.o. 

sign 

## ◆ MAX_PACKET_LENGTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |6 

Maximum length of protocol packet. 

[OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) length limit also restricted to this value as any length greater than this value will have first byte of [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) to be 254 thus does not provide a means to identify if this is [OK_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_ok_packet.html) or [EOF_Packet](https://dev.mysql.com/doc/dev/mysql-server/latest/page_protocol_basic_eof_packet.html). 

## ◆ MAX_SMALLINT_WIDTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |7 

Max width for a SHORT w.o. 

sign 

## ◆ MAX_TINYINT_WIDTH

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |8 

Max width for a TINY w.o. 

sign 

## ◆ MYSQL_AUTODETECT_CHARSET_NAME

| Typedefs |  |
| --- | --- |
| typedef struct NET | NET |
|  |  |9 

## ◆ MYSQL_ERRMSG_SIZE

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |0 

Max length of a error message. 

Should be kept in sync with ERRMSGSIZE. 

## ◆ MYSQL_LONG_DATA_HEADER

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |1 

## ◆ MYSQL_STMT_HEADER

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |2 

## ◆ MYSQL_VIO

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |3 

## ◆ NAME_CHAR_LEN

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |4 

Field/table name length. 

## ◆ NAME_LEN

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |5 

## ◆ NET_ERROR_SOCKET_NOT_READABLE

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |6 

Try write and close socket. 

## ◆ NET_ERROR_SOCKET_NOT_WRITABLE

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |7 

Try read and close socket. 

## ◆ NET_ERROR_SOCKET_RECOVERABLE

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |8 

Socket still usable. 

## ◆ NET_ERROR_SOCKET_UNUSABLE

| Enumerations |  |
| --- | --- |
| enum | SERVER_STATUS_flags_enum { SERVER_STATUS_IN_TRANS = 1 , SERVER_STATUS_AUTOCOMMIT = 2 , SERVER_MORE_RESULTS_EXISTS = 8 , SERVER_QUERY_NO_GOOD_INDEX_USED = 16 , SERVER_QUERY_NO_INDEX_USED = 32 , SERVER_STATUS_CURSOR_EXISTS = 64 , SERVER_STATUS_LAST_ROW_SENT = 128 , SERVER_STATUS_DB_DROPPED = 256 , SERVER_STATUS_NO_BACKSLASH_ESCAPES = 512 , SERVER_STATUS_METADATA_CHANGED = 1024 , SERVER_QUERY_WAS_SLOW = 2048 , SERVER_PS_OUT_PARAMS = 4096 , SERVER_STATUS_IN_TRANS_READONLY = 8192 , SERVER_SESSION_STATE_CHANGED = (1UL << 14) } |
|  | The status flags are a bit-field. More... |
|  |  |
| enum | mysql_enum_shutdown_level { SHUTDOWN_DEFAULT = 0 , SHUTDOWN_WAIT_CONNECTIONS = MYSQL_SHUTDOWN_KILLABLE_CONNECT , SHUTDOWN_WAIT_TRANSACTIONS = MYSQL_SHUTDOWN_KILLABLE_TRANS , SHUTDOWN_WAIT_UPDATES = MYSQL_SHUTDOWN_KILLABLE_UPDATE , SHUTDOWN_WAIT_ALL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) , SHUTDOWN_WAIT_CRITICAL_BUFFERS = (MYSQL_SHUTDOWN_KILLABLE_UPDATE << 1) + 1 , KILL_QUERY = 254 , KILL_CONNECTION = 255 } |
|  | We want levels to be in growing order of hardness (because we use number comparisons). More... |
|  |  |
| enum | enum_resultset_metadata { RESULTSET_METADATA_NONE = 0 , RESULTSET_METADATA_FULL = 1 } |
|  |  |
| enum | enum_cursor_type { CURSOR_TYPE_NO_CURSOR = 0 , CURSOR_TYPE_READ_ONLY = 1 , CURSOR_TYPE_FOR_UPDATE = 2 , CURSOR_TYPE_SCROLLABLE = 4 , PARAMETER_COUNT_AVAILABLE = 8 } |
|  | The flags used in COM_STMT_EXECUTE. More... |
|  |  |
| enum | enum_mysql_set_option { MYSQL_OPTION_MULTI_STATEMENTS_ON , MYSQL_OPTION_MULTI_STATEMENTS_OFF } |
|  | options for mysql_options() More... |
|  |  |
| enum | enum_session_state_type { SESSION_TRACK_SYSTEM_VARIABLES , SESSION_TRACK_SCHEMA , SESSION_TRACK_STATE_CHANGE , SESSION_TRACK_GTIDS , SESSION_TRACK_TRANSACTION_CHARACTERISTICS , SESSION_TRACK_TRANSACTION_STATE } |
|  | Type of state change information that the server can include in the Ok packet. More... |
|  |  |
| enum | connect_stage { CONNECT_STAGE_INVALID = 0 , CONNECT_STAGE_NOT_STARTED , CONNECT_STAGE_NET_BEGIN_CONNECT , CONNECT_STAGE_NET_WAIT_CONNECT , CONNECT_STAGE_NET_COMPLETE_CONNECT , CONNECT_STAGE_READ_GREETING , CONNECT_STAGE_PARSE_HANDSHAKE , CONNECT_STAGE_ESTABLISH_SSL , CONNECT_STAGE_AUTHENTICATE , CONNECT_STAGE_AUTH_BEGIN , CONNECT_STAGE_AUTH_RUN_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_HANDLE_FIRST_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_READ_CHANGE_USER_RESULT , CONNECT_STAGE_AUTH_HANDLE_CHANGE_USER_REQUEST , CONNECT_STAGE_AUTH_RUN_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_INIT_MULTI_AUTH , CONNECT_STAGE_AUTH_FINISH_AUTH , CONNECT_STAGE_AUTH_HANDLE_SECOND_AUTHENTICATE_USER , CONNECT_STAGE_AUTH_DO_MULTI_PLUGIN_AUTH , CONNECT_STAGE_AUTH_HANDLE_MULTI_AUTH_RESPONSE , CONNECT_STAGE_PREP_SELECT_DATABASE , CONNECT_STAGE_PREP_INIT_COMMANDS , CONNECT_STAGE_SEND_ONE_INIT_COMMAND , CONNECT_STAGE_COMPLETE } |
|  | Describes the current state of Asynchronous connection phase state machine. More... |
|  |  |9 

Do not use the socket. 

## ◆ NET_ERROR_UNSET

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |0 

No error has occurred yet. 

## ◆ net_new_transaction

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |1 

## ◆ NET_READ_TIMEOUT

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |2 

Timeout on read. 

## ◆ NET_WAIT_TIMEOUT

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |3 

Wait for new query. 

## ◆ NET_WRITE_TIMEOUT

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |4 

Timeout on write. 

## ◆ NULL_LENGTH

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |5 

For net_store_length() 

## ◆ ONLY_KILL_QUERY

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |6 

Flag used by the parser. 

Kill only the query and not the connection.

See also
    SQLCOM_KILL, sql_kill(), LEX::type 

## ◆ packet_error

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |7 

## ◆ PARTITION_EXPR_CHAR_LEN

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |8 

Maximum expression length in chars . 

## ◆ RELYING_PARTY_ID_LENGTH

| Functions |  |
| --- | --- |
| bool | my_net_init (struct NET *net, MYSQL_VIO vio) |
|  |  |
| void | my_net_local_init (struct NET *net) |
|  |  |
| void | net_end (struct NET *net) |
|  |  |
| void | net_clear (struct NET *net, bool check_buffer) |
|  | Clear (reinitialize) the NET structure for a new command. More... |
|  |  |
| void | net_claim_memory_ownership (struct NET *net, bool claim) |
|  |  |
| bool | net_realloc (struct NET *net, size_t length) |
|  | Realloc the packet buffer. More... |
|  |  |
| bool | net_flush (struct NET *net) |
|  | Flush write_buffer if not empty. More... |
|  |  |
| bool | my_net_write (struct NET *net, const unsigned char *packet, size_t len) |
|  | Write a logical packet with packet header. More... |
|  |  |
| bool | net_write_command (struct NET *net, unsigned char command, const unsigned char *header, size_t head_len, const unsigned char *packet, size_t len) |
|  | Send a command to the server. More... |
|  |  |
| bool | net_write_packet (struct NET *net, const unsigned char *packet, size_t length) |
|  | Write a MySQL protocol packet to the network handler. More... |
|  |  |
| unsigned long | my_net_read (struct NET *net) |
|  | Read a packet from the client/server and return it without the internal package header. More... |
|  |  |
| void | my_net_set_write_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_read_timeout (struct NET *net, unsigned int timeout) |
|  |  |
| void | my_net_set_retry_count (struct NET *net, unsigned int retry_count) |
|  |  |
| char * | octet2hex (char *to, const char *str, unsigned int len) |
|  |  |
| bool | generate_sha256_scramble (unsigned char *dst, size_t dst_size, const char *src, size_t src_size, const char *rnd, size_t rnd_size) |
|  |  |
| char * | get_tty_password (const char *opt_message) |
|  | Read a password from the terminal without echoing the typed characters. More... |
|  |  |
| const char * | mysql_errno_to_sqlstate (unsigned int mysql_errno) |
|  |  |
| bool | my_thread_init (void) |
|  | Allocate thread specific memory for the thread, used by mysys and dbug. More... |
|  |  |
| void | my_thread_end (void) |
|  | Deallocate memory used by the thread for book-keeping. More... |
|  |  |
| uint64_t | net_field_length_ll (unsigned char **packet) |
|  |  |
| unsigned char * | net_store_length (unsigned char *pkg, unsigned long long length) |
|  |  |
| unsigned int | net_length_size (unsigned long long num) |
|  |  |
| unsigned int | net_field_length_size (const unsigned char *pos) |
|  | length of buffer required to represent a length-encoded string give the length part of length encoded string. More... |
|  |  |
| uint64_t | net_length_size_including_self (uint64_t length_without_self) |
|  | Calculates length of the field in case value of this field includes length of this field (self) More... |
|  |  |9 

## ◆ SCRAMBLE_LENGTH

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |0 

Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. 

## ◆ SCRAMBLED_PASSWORD_CHAR_LENGTH

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |1 

length of password stored in the db: new passwords are preceded with '*' 

## ◆ SERVER_STATUS_CLEAR_SET

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |2 

**Value:**

([SERVER_QUERY_NO_GOOD_INDEX_USED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cada9d7e25abeeb655a65040b4c3a3379a2a) | [SERVER_QUERY_NO_INDEX_USED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cadad6f51ea9bad988c70f1b47ec803f86fa) | \

SERVER_MORE_RESULTS_EXISTS | [SERVER_STATUS_METADATA_CHANGED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cadaec1900866a5163e09428dbab429c2e80) | \

SERVER_QUERY_WAS_SLOW | [SERVER_STATUS_DB_DROPPED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cada429d26c30f5e982a1ff259390d49875f) | \

SERVER_STATUS_CURSOR_EXISTS | [SERVER_STATUS_LAST_ROW_SENT](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cada0343c9eaa47dd1b7558d07eda287e49b) | \

SERVER_SESSION_STATE_CHANGED)

[SERVER_STATUS_LAST_ROW_SENT](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cada0343c9eaa47dd1b7558d07eda287e49b)

@ SERVER_STATUS_LAST_ROW_SENT

This flag is sent when a read-only cursor is exhausted, in reply to COM_STMT_FETCH command.

**Definition:** mysql_com.h:841

[SERVER_STATUS_DB_DROPPED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cada429d26c30f5e982a1ff259390d49875f)

@ SERVER_STATUS_DB_DROPPED

A database was dropped.

**Definition:** mysql_com.h:842

[SERVER_QUERY_NO_GOOD_INDEX_USED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cada9d7e25abeeb655a65040b4c3a3379a2a)

@ SERVER_QUERY_NO_GOOD_INDEX_USED

**Definition:** mysql_com.h:826

[SERVER_QUERY_NO_INDEX_USED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cadad6f51ea9bad988c70f1b47ec803f86fa)

@ SERVER_QUERY_NO_INDEX_USED

**Definition:** mysql_com.h:827

[SERVER_STATUS_METADATA_CHANGED](https://dev.mysql.com/doc/dev/mysql-server/latest/mysql__com_8h.html#a1d854e841086925be1883e4d7b4e8cadaec1900866a5163e09428dbab429c2e80)

@ SERVER_STATUS_METADATA_CHANGED

Sent to the client if after a prepared statement reprepare we discovered that the new statement retur...

**Definition:** mysql_com.h:849

Server status flags that must be cleared when starting execution of a new SQL statement. 

Flags from this set are only added to the current server status by the execution engine, but never removed - the execution engine expects them to disappear automagically by the next command. 

## ◆ SERVER_VERSION_LENGTH

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |3 

## ◆ SESSION_TRACK_BEGIN

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |4 

start of enum_session_state_type 

## ◆ SESSION_TRACK_END

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |5 

End of enum_session_state_type. 

## ◆ SQLSTATE_LENGTH

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |6 

## ◆ SYSTEM_CHARSET_MBMAXLEN

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |7 

## ◆ TABLE_COMMENT_INLINE_MAXLEN

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |8 

Maximum length of comments. 

pre 5.6: 60 characters 

## ◆ TABLE_COMMENT_MAXLEN

| #define AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
| --- |9 

## ◆ TABLE_PARTITION_COMMENT_MAXLEN

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |0 

## ◆ TABLESPACE_COMMENT_MAXLEN

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |1 

## ◆ USERNAME_CHAR_LENGTH

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |2 

## ◆ USERNAME_CHAR_LENGTH_STR

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |3 

## ◆ USERNAME_LENGTH

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |4 

## Typedef Documentation

## ◆ NET

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |5 

## Enumeration Type Documentation

## ◆ connect_stage

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |6 

Describes the current state of Asynchronous connection phase state machine. 

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |7 

## ◆ enum_cursor_type

| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |8 

The flags used in COM_STMT_EXECUTE. 

See also
    [Protocol_classic::parse_packet](https://dev.mysql.com/doc/dev/mysql-server/latest/classProtocol__classic.html#a10881ef1e393483e7941afa756bc94f1), [mysql_int_serialize_param_data](https://dev.mysql.com/doc/dev/mysql-server/latest/bind__params_8cc.html#aabb465810796b1eee4ddfd7e4327da7a)
| #define CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
| --- |9 

## ◆ enum_mysql_set_option

| #define CHALLENGE_LENGTH 32 |
| --- |0 

options for mysql_options() 

| #define CHALLENGE_LENGTH 32 |
| --- |1 

## ◆ enum_resultset_metadata

| #define CHALLENGE_LENGTH 32 |
| --- |2 

| #define CHALLENGE_LENGTH 32 |
| --- |3 

## ◆ enum_session_state_type

| #define CHALLENGE_LENGTH 32 |
| --- |4 

Type of state change information that the server can include in the Ok packet. 

Note
    

  * session_state_type shouldn't go past 255 (i.e. 1-byte boundary).
  * Modify the definition of SESSION_TRACK_END when a new member is added. 

| #define CHALLENGE_LENGTH 32 |
| --- |5 

## ◆ SERVER_STATUS_flags_enum

| #define CHALLENGE_LENGTH 32 |
| --- |6 

The status flags are a bit-field. 

| #define CHALLENGE_LENGTH 32 |
| --- |7 

## Function Documentation

## ◆ generate_sha256_scramble()

| #define CHALLENGE_LENGTH 32 |
| --- |8 

## ◆ get_tty_password()

| #define CHALLENGE_LENGTH 32 |
| --- |9 

Read a password from the terminal without echoing the typed characters. 

Displays `opt_message` (or the default prompt "Enter password: ") and reads characters one by one until the user presses Enter, Ctrl-C, or until the internal buffer is exhausted. The returned string is allocated with my_strdup() (MY_FAE flag); the caller must release it with my_free().

Parameters
     | #define CLIENT_ALL_FLAGS |
| --- |0 

Returns
    Heap-allocated, NUL-terminated password string.

Note
    Bug#44929 / Bug#92403 / Bug#110570 The internal stack buffer was historically 80 bytes, which silently truncated any password longer than 79 characters; the NUL terminator consumed the 80th slot and all further input was discarded without warning. This caused authentication failures for high-entropy passwords and made it impossible to use long authentication credentials (such as OAuth/OIDC access tokens, which routinely exceed 2000 bytes) through the interactive prompt.

Two concrete scenarios exposed this defect:

(1) Long passwords. Some deployments (notably managed cloud MySQL services) permit account passwords of 128 characters or more. Users who chose a password of 80 characters or more could create the account successfully, but every subsequent attempt to authenticate with `mysql` `-p` would silently strip the password to 79 characters before sending it to the server, producing an "Access denied" error with no indication that truncation had occurred.

(2) Token-based authentication. Authentication plugins such as `mysql_clear_password` are commonly used to forward externally issued bearer tokens (for example OAuth 2.0 / OIDC access tokens) as the password field. Such tokens routinely exceed 2000 characters (a typical JWT bearer token is ~2400 characters). Users who preferred the interactive workflow -- running `mysql` `-p` and then pasting the token at the "Enter password:" prompt -- were unable to authenticate because the token was silently truncated to 79 characters. The resulting "Access denied" error gave no hint that the credential had been cut short, making the problem difficult to diagnose.

In both cases the only viable workaround was to pass the credential inline as `-p<value>` (no space), which bypasses get_tty_password() entirely. However that approach exposes the password or token in the operating-system process list and the shell command history, which is unacceptable in security- conscious environments.

The buffer has been enlarged to 4096 bytes. Passwords and tokens up to 4095 characters can now be entered interactively. The downstream path -- opt_password[], mysql->passwd, and clear_password_auth_client() -- imposes no additional length restriction, so the full credential is transmitted to the server. 

## ◆ my_net_init()

| #define CLIENT_ALL_FLAGS |
| --- |1 

## ◆ my_net_local_init()

| #define CLIENT_ALL_FLAGS |
| --- |2 

## ◆ my_net_read()

| #define CLIENT_ALL_FLAGS |
| --- |3 

Read a packet from the client/server and return it without the internal package header. 

If the packet is the first packet of a multi-packet packet (which is indicated by the length of the packet = 0xffffff) then all sub packets are read and concatenated.

If the packet was compressed, its uncompressed and the length of the uncompressed packet is returned.

Returns
    The function returns the length of the found packet or packet_error. net->read_pos points to the read data. 

## ◆ my_net_set_read_timeout()

| #define CLIENT_ALL_FLAGS |
| --- |4 

## ◆ my_net_set_retry_count()

| #define CLIENT_ALL_FLAGS |
| --- |5 

## ◆ my_net_set_write_timeout()

| #define CLIENT_ALL_FLAGS |
| --- |6 

## ◆ my_net_write()

| #define CLIENT_ALL_FLAGS |
| --- |7 

Write a logical packet with packet header. 

Format: Packet length (3 bytes), packet number (1 byte) When compression is used, a 3 byte compression length is added.

Note
    If compression is used, the original packet is modified! 

## ◆ my_thread_end()

| #define CLIENT_ALL_FLAGS |
| --- |8 

Deallocate memory used by the thread for book-keeping. 

Note
    This may be called multiple times for a thread. This happens for example when one calls 'mysql_server_init()' mysql_server_end() and then ends with a mysql_end(). 

## ◆ my_thread_init()

| #define CLIENT_ALL_FLAGS |
| --- |9 

Allocate thread specific memory for the thread, used by mysys and dbug. 

Note
    This function may called multiple times for a thread, for example if one uses my_init() followed by mysql_server_init().

Return values
     | #define CLIENT_BASIC_FLAGS |
| --- |0 

## ◆ mysql_errno_to_sqlstate()

| #define CLIENT_BASIC_FLAGS |
| --- |1 

## ◆ net_claim_memory_ownership()

| #define CLIENT_BASIC_FLAGS |
| --- |2 

## ◆ net_clear()

| #define CLIENT_BASIC_FLAGS |
| --- |3 

Clear (reinitialize) the NET structure for a new command. 

Remarks
    Performs debug checking of the socket buffer to ensure that the protocol sequence is correct.

Parameters
     | #define CLIENT_BASIC_FLAGS |
| --- |4 

## ◆ net_end()

| #define CLIENT_BASIC_FLAGS |
| --- |5 

## ◆ net_field_length_ll()

| #define CLIENT_BASIC_FLAGS |
| --- |6 

## ◆ net_field_length_size()

| #define CLIENT_BASIC_FLAGS |
| --- |7 

length of buffer required to represent a length-encoded string give the length part of length encoded string. 

This function can be used before calling net_field_lenth/net_field_length_ll.

Parameters
     | #define CLIENT_BASIC_FLAGS |
| --- |8 

Returns
    length of buffer needed to store this number [1, 3, 4, 9]. 

## ◆ net_flush()

| #define CLIENT_BASIC_FLAGS |
| --- |9 

Flush write_buffer if not empty. 

## ◆ net_length_size()

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |00 

## ◆ net_length_size_including_self()

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |01 

Calculates length of the field in case value of this field includes length of this field (self) 

Parameters
     | Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |02 

Returns
    Size of the field including self 

## ◆ net_realloc()

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |03 

Realloc the packet buffer. 

## ◆ net_store_length()

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |04 

## ◆ net_write_command()

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |05 

Send a command to the server. 

The reason for having both header and packet is so that libmysql can easy add a header to a special command (like prepared statements) without having to re-alloc the string.

As the command is part of the first data packet, we have to do some data juggling to put the command in there, without having to create a new packet.

This function will split big packets into sub-packets if needed. (Each sub packet can only be 2^24 bytes)

Parameters
     | Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |06 

Return values
     | Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |07 

## ◆ net_write_packet()

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |08 

Write a MySQL protocol packet to the network handler. 

Parameters
     | Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |09 

Remarks
    The packet might be encapsulated into a compressed packet.

Returns
    true on error, false on success. 

## ◆ octet2hex()

| Macros |  |
| --- | --- |
| #define | SYSTEM_CHARSET_MBMAXLEN 3 |
|  |  |
| #define | FILENAME_CHARSET_MBMAXLEN 5 |
|  |  |
| #define | NAME_CHAR_LEN 64 |
|  | Field/table name length. More... |
|  |  |
| #define | PARTITION_EXPR_CHAR_LEN 2048 |
|  | Maximum expression length in chars . More... |
|  |  |
| #define | USERNAME_CHAR_LENGTH 32 |
|  |  |
| #define | USERNAME_CHAR_LENGTH_STR "32" |
|  |  |
| #define | NAME_LEN (NAME_CHAR_LEN * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | USERNAME_LENGTH (USERNAME_CHAR_LENGTH * SYSTEM_CHARSET_MBMAXLEN) |
|  |  |
| #define | CONNECT_STRING_MAXLEN 1024 |
|  |  |
| #define | MYSQL_AUTODETECT_CHARSET_NAME "auto" |
|  |  |
| #define | SERVER_VERSION_LENGTH 60 |
|  |  |
| #define | SQLSTATE_LENGTH 5 |
|  |  |
| #define | RELYING_PARTY_ID_LENGTH 255 |
|  |  |
| #define | CHALLENGE_LENGTH 32 |
|  |  |
| #define | MAX_AUTH_FACTORS 3 |
|  |  |
| #define | TABLE_COMMENT_INLINE_MAXLEN 180 |
|  | Maximum length of comments. More... |
|  |  |
| #define | TABLE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | COLUMN_COMMENT_MAXLEN 1024 |
|  |  |
| #define | INDEX_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLE_PARTITION_COMMENT_MAXLEN 1024 |
|  |  |
| #define | TABLESPACE_COMMENT_MAXLEN 2048 |
|  |  |
| #define | MAX_PACKET_LENGTH (256L * 256L * 256L - 1) |
|  | Maximum length of protocol packet. More... |
|  |  |
| #define | LOCAL_HOST "localhost" |
|  |  |
| #define | LOCAL_HOST_NAMEDPIPE "." |
|  |  |
| #define | FRM_GCOL_HEADER_SIZE 4 |
|  | The length of the header part for each generated column in the .frm file. More... |
|  |  |
| #define | GENERATED_COLUMN_EXPRESSION_MAXLEN 65535 - FRM_GCOL_HEADER_SIZE |
|  | Maximum length of the expression statement defined for generated columns. More... |
|  |  |
| #define | SCRAMBLE_LENGTH 20 |
|  | Length of random string sent by server on handshake; this is also length of obfuscated password, received from client. More... |
|  |  |
| #define | AUTH_PLUGIN_DATA_PART_1_LENGTH 8 |
|  |  |
| #define | SCRAMBLED_PASSWORD_CHAR_LENGTH (SCRAMBLE_LENGTH * 2 + 1) |
|  | length of password stored in the db: new passwords are preceded with '*' More... |
|  |  |
| #define | NOT_NULL_FLAG 1 |
|  | Field can't be NULL. More... |
|  |  |
| #define | PRI_KEY_FLAG 2 |
|  | Field is part of a primary key. More... |
|  |  |
| #define | UNIQUE_KEY_FLAG 4 |
|  | Field is part of a unique key. More... |
|  |  |
| #define | MULTIPLE_KEY_FLAG 8 |
|  | Field is part of a key. More... |
|  |  |
| #define | BLOB_FLAG 16 |
|  | Field is a blob. More... |
|  |  |
| #define | UNSIGNED_FLAG 32 |
|  | Field is unsigned. More... |
|  |  |
| #define | ZEROFILL_FLAG 64 |
|  | Field is zerofill. More... |
|  |  |
| #define | BINARY_FLAG 128 |
|  | Field is binary More... |
|  |  |
| #define | ENUM_FLAG 256 |
|  | field is an enum More... |
|  |  |
| #define | AUTO_INCREMENT_FLAG 512 |
|  | field is a autoincrement field More... |
|  |  |
| #define | TIMESTAMP_FLAG 1024 |
|  | Field is a timestamp. More... |
|  |  |
| #define | SET_FLAG 2048 |
|  | field is a set More... |
|  |  |
| #define | NO_DEFAULT_VALUE_FLAG 4096 |
|  | Field doesn't have default value. More... |
|  |  |
| #define | ON_UPDATE_NOW_FLAG 8192 |
|  | Field is set to NOW on UPDATE. More... |
|  |  |
| #define | PART_KEY_FLAG 16384 |
|  | Intern; Part of some key. More... |
|  |  |
| #define | NUM_FLAG 32768 |
|  | Field is num (for clients) More... |
|  |  |
| #define | UNIQUE_FLAG 65536 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | BINCMP_FLAG 131072 |
|  | Intern: Used by sql_yacc. More... |
|  |  |
| #define | GET_FIXED_FIELDS_FLAG (1 << 18) |
|  | Used to get fields in item tree . More... |
|  |  |
| #define | FIELD_IN_PART_FUNC_FLAG (1 << 19) |
|  | Field part of partition func. More... |
|  |  |
| #define | FIELD_IN_ADD_INDEX (1 << 20) |
|  | Intern: Field in TABLE object for new version of altered table, which participates in a newly added index. More... |
|  |  |
| #define | FIELD_IS_RENAMED (1 << 21) |
|  | Intern: Field is being renamed. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA 22 |
|  | Field storage media, bit 22-23. More... |
|  |  |
| #define | FIELD_FLAGS_STORAGE_MEDIA_MASK (3 << FIELD_FLAGS_STORAGE_MEDIA) |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT 24 |
|  | Field column format, bit 24-25. More... |
|  |  |
| #define | FIELD_FLAGS_COLUMN_FORMAT_MASK (3 << FIELD_FLAGS_COLUMN_FORMAT) |
|  |  |
| #define | FIELD_IS_DROPPED (1 << 26) |
|  | Intern: Field is being dropped. More... |
|  |  |
| #define | EXPLICIT_NULL_FLAG (1 << 27) |
|  | Field is explicitly specified as \ NULL by the user. More... |
|  |  |
| #define | GROUP_FLAG (1 << 28) |
|  | Intern: Group field. More... |
|  |  |
| #define | NOT_SECONDARY_FLAG (1 << 29) |
|  | Field will not be loaded in secondary engine. More... |
|  |  |
| #define | FIELD_IS_INVISIBLE (1 << 30) |
|  | Field is explicitly marked as invisible by the user. More... |
|  |  |
| #define | REFRESH_GRANT 1 |
|  | Refresh grant tables, FLUSH PRIVILEGES. More... |
|  |  |
| #define | REFRESH_LOG 2 |
|  | Start on new log file, FLUSH LOGS. More... |
|  |  |
| #define | REFRESH_TABLES 4 |
|  | close all tables, FLUSH TABLES More... |
|  |  |
| #define | UNUSED_8 8 |
|  | Previously REFRESH_HOSTS but not used anymore. More... |
|  |  |
| #define | REFRESH_STATUS 16 |
|  | Flush status variables, FLUSH STATUS. More... |
|  |  |
| #define | UNUSED_32 32 |
|  | Removed. More... |
|  |  |
| #define | REFRESH_REPLICA 64 |
|  | Reset source info and restart replica \ thread, RESET REPLICA. More... |
|  |  |
| #define | REFRESH_SOURCE 128 |
|  | Remove all bin logs in the index \ and truncate the index. More... |
|  |  |
| #define | REFRESH_ERROR_LOG 256 |
|  | Rotate only the error log. More... |
|  |  |
| #define | REFRESH_ENGINE_LOG 512 |
|  | Flush all storage engine logs. More... |
|  |  |
| #define | REFRESH_BINARY_LOG 1024 |
|  | Flush the binary log. More... |
|  |  |
| #define | REFRESH_RELAY_LOG 2048 |
|  | Flush the relay log. More... |
|  |  |
| #define | REFRESH_GENERAL_LOG 4096 |
|  | Flush the general log. More... |
|  |  |
| #define | REFRESH_SLOW_LOG 8192 |
|  | Flush the slow query log. More... |
|  |  |
| #define | REFRESH_READ_LOCK 16384 |
|  | Lock tables for read. More... |
|  |  |
| #define | REFRESH_FAST 32768 |
|  | Wait for an impending flush before closing the tables. More... |
|  |  |
| #define | REFRESH_USER_RESOURCES |
|  |  |
| #define | REFRESH_FOR_EXPORT 0x100000L /** FLUSH TABLES ... FOR EXPORT */ |
|  |  |
| #define | REFRESH_OPTIMIZER_COSTS 0x200000L /** FLUSH OPTIMIZER_COSTS */ |
|  |  |
| #define | REFRESH_PERSIST 0x400000L /** RESET PERSIST */ |
|  |  |
| #define | CLIENT_LONG_PASSWORD 1 |
|  | Use the improved version of Old Password Authentication. More... |
|  |  |
| #define | CLIENT_FOUND_ROWS 2 |
|  | Send found rows instead of affected rows in EOF_Packet. More... |
|  |  |
| #define | CLIENT_LONG_FLAG 4 |
|  | Get all column flags. More... |
|  |  |
| #define | CLIENT_CONNECT_WITH_DB 8 |
|  | Database (schema) name can be specified on connect in Handshake Response Packet. More... |
|  |  |
| #define | CLIENT_NO_SCHEMA 16 |
|  | DEPRECATED: Don't allow database.table.column. More... |
|  |  |
| #define | CLIENT_COMPRESS 32 |
|  | Compression protocol supported. More... |
|  |  |
| #define | CLIENT_ODBC 64 |
|  | Special handling of ODBC behavior. More... |
|  |  |
| #define | CLIENT_LOCAL_FILES 128 |
|  | Can use LOAD DATA LOCAL. More... |
|  |  |
| #define | CLIENT_IGNORE_SPACE 256 |
|  | Ignore spaces before '('. More... |
|  |  |
| #define | CLIENT_PROTOCOL_41 512 |
|  | New 4.1 protocol. More... |
|  |  |
| #define | CLIENT_INTERACTIVE 1024 |
|  | This is an interactive client. More... |
|  |  |
| #define | CLIENT_SSL 2048 |
|  | Use SSL encryption for the session. More... |
|  |  |
| #define | CLIENT_IGNORE_SIGPIPE 4096 |
|  | Client only flag. More... |
|  |  |
| #define | CLIENT_TRANSACTIONS 8192 |
|  | Client knows about transactions. More... |
|  |  |
| #define | CLIENT_RESERVED 16384 |
|  | DEPRECATED: Old flag for 4.1 protocol More... |
|  |  |
| #define | CLIENT_RESERVED2 32768 |
|  | DEPRECATED: Old flag for 4.1 authentication \ CLIENT_SECURE_CONNECTION. More... |
|  |  |
| #define | CLIENT_MULTI_STATEMENTS (1UL << 16) |
|  | Enable/disable multi-stmt support. More... |
|  |  |
| #define | CLIENT_MULTI_RESULTS (1UL << 17) |
|  | Enable/disable multi-results. More... |
|  |  |
| #define | CLIENT_PS_MULTI_RESULTS (1UL << 18) |
|  | Multi-results and OUT parameters in PS-protocol. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH (1UL << 19) |
|  | Client supports plugin authentication. More... |
|  |  |
| #define | CLIENT_CONNECT_ATTRS (1UL << 20) |
|  | Client supports connection attributes. More... |
|  |  |
| #define | CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA (1UL << 21) |
|  | Enable authentication response packet to be larger than 255 bytes. More... |
|  |  |
| #define | CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS (1UL << 22) |
|  | Don't close the connection for a user account with expired password. More... |
|  |  |
| #define | CLIENT_SESSION_TRACK (1UL << 23) |
|  | Capable of handling server state change information. More... |
|  |  |
| #define | CLIENT_DEPRECATE_EOF (1UL << 24) |
|  | Client no longer needs EOF_Packet and will use OK_Packet instead. More... |
|  |  |
| #define | CLIENT_OPTIONAL_RESULTSET_METADATA (1UL << 25) |
|  | The client can handle optional metadata information in the resultset. More... |
|  |  |
| #define | CLIENT_ZSTD_COMPRESSION_ALGORITHM (1UL << 26) |
|  | Compression protocol extended to support zstd compression method. More... |
|  |  |
| #define | CLIENT_QUERY_ATTRIBUTES (1UL << 27) |
|  | Support optional extension for query parameters into the COM_QUERY and COM_STMT_EXECUTE packets. More... |
|  |  |
| #define | MULTI_FACTOR_AUTHENTICATION (1UL << 28) |
|  | Support Multi factor authentication. More... |
|  |  |
| #define | CLIENT_CAPABILITY_EXTENSION (1UL << 29) |
|  | This flag is reserved to extend the 32bit capabilities structure to 64bits. More... |
|  |  |
| #define | CLIENT_SSL_VERIFY_SERVER_CERT (1UL << 30) |
|  | Verify server certificate. More... |
|  |  |
| #define | CLIENT_REMEMBER_OPTIONS (1UL << 31) |
|  | Don't reset the options after an unsuccessful connect. More... |
|  |  |
| #define | CAN_CLIENT_COMPRESS CLIENT_COMPRESS |
|  | a compatibility alias for CLIENT_COMPRESS More... |
|  |  |
| #define | CLIENT_ALL_FLAGS |
|  | Gather all possible capabilities (flags) supported by the client and/or server. More... |
|  |  |
| #define | CLIENT_ONLY_ALL_FLAGS |
|  | Flags only supported by the client. More... |
|  |  |
| #define | CLIENT_BASIC_FLAGS |
|  | Switch off from CLIENT_ALL_FLAGS the flags that are optional and depending on build flags. More... |
|  |  |
| #define | SERVER_STATUS_CLEAR_SET |
|  | Server status flags that must be cleared when starting execution of a new SQL statement. More... |
|  |  |
| #define | MYSQL_ERRMSG_SIZE 512 |
|  | Max length of a error message. More... |
|  |  |
| #define | NET_READ_TIMEOUT 30 |
|  | Timeout on read. More... |
|  |  |
| #define | NET_WRITE_TIMEOUT 60 |
|  | Timeout on write. More... |
|  |  |
| #define | NET_WAIT_TIMEOUT 8 * 60 * 60 |
|  | Wait for new query. More... |
|  |  |
| #define | ONLY_KILL_QUERY 1 |
|  | Flag used by the parser. More... |
|  |  |
| #define | MYSQL_VIO struct Vio * |
|  |  |
| #define | MAX_TINYINT_WIDTH 3 |
|  | Max width for a TINY w.o. More... |
|  |  |
| #define | MAX_SMALLINT_WIDTH 5 |
|  | Max width for a SHORT w.o. More... |
|  |  |
| #define | MAX_MEDIUMINT_WIDTH 8 |
|  | Max width for a INT24 w.o. More... |
|  |  |
| #define | MAX_INT_WIDTH 10 |
|  | Max width for a LONG w.o. More... |
|  |  |
| #define | MAX_BIGINT_WIDTH 20 |
|  | Max width for a LONGLONG. More... |
|  |  |
| #define | MAX_CHAR_WIDTH 255 |
|  | Max width for a CHAR column, in number of characters. More... |
|  |  |
| #define | MAX_BLOB_WIDTH 16777216 |
|  | Default width for blob in bytes. More... |
|  |  |
| #define | NET_ERROR_UNSET 0 |
|  | No error has occurred yet. More... |
|  |  |
| #define | NET_ERROR_SOCKET_RECOVERABLE 1 |
|  | Socket still usable. More... |
|  |  |
| #define | NET_ERROR_SOCKET_UNUSABLE 2 |
|  | Do not use the socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_READABLE 3 |
|  | Try write and close socket. More... |
|  |  |
| #define | NET_ERROR_SOCKET_NOT_WRITABLE 4 |
|  | Try read and close socket. More... |
|  |  |
| #define | packet_error (~(unsigned long)0) |
|  |  |
| #define | CLIENT_MULTI_QUERIES CLIENT_MULTI_STATEMENTS |
|  |  |
| #define | FIELD_TYPE_DECIMAL MYSQL_TYPE_DECIMAL |
|  |  |
| #define | FIELD_TYPE_NEWDECIMAL MYSQL_TYPE_NEWDECIMAL |
|  |  |
| #define | FIELD_TYPE_TINY MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_SHORT MYSQL_TYPE_SHORT |
|  |  |
| #define | FIELD_TYPE_LONG MYSQL_TYPE_LONG |
|  |  |
| #define | FIELD_TYPE_FLOAT MYSQL_TYPE_FLOAT |
|  |  |
| #define | FIELD_TYPE_DOUBLE MYSQL_TYPE_DOUBLE |
|  |  |
| #define | FIELD_TYPE_NULL MYSQL_TYPE_NULL |
|  |  |
| #define | FIELD_TYPE_TIMESTAMP MYSQL_TYPE_TIMESTAMP |
|  |  |
| #define | FIELD_TYPE_LONGLONG MYSQL_TYPE_LONGLONG |
|  |  |
| #define | FIELD_TYPE_INT24 MYSQL_TYPE_INT24 |
|  |  |
| #define | FIELD_TYPE_DATE MYSQL_TYPE_DATE |
|  |  |
| #define | FIELD_TYPE_TIME MYSQL_TYPE_TIME |
|  |  |
| #define | FIELD_TYPE_DATETIME MYSQL_TYPE_DATETIME |
|  |  |
| #define | FIELD_TYPE_YEAR MYSQL_TYPE_YEAR |
|  |  |
| #define | FIELD_TYPE_NEWDATE MYSQL_TYPE_NEWDATE |
|  |  |
| #define | FIELD_TYPE_ENUM MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_SET MYSQL_TYPE_SET |
|  |  |
| #define | FIELD_TYPE_TINY_BLOB MYSQL_TYPE_TINY_BLOB |
|  |  |
| #define | FIELD_TYPE_MEDIUM_BLOB MYSQL_TYPE_MEDIUM_BLOB |
|  |  |
| #define | FIELD_TYPE_LONG_BLOB MYSQL_TYPE_LONG_BLOB |
|  |  |
| #define | FIELD_TYPE_BLOB MYSQL_TYPE_BLOB |
|  |  |
| #define | FIELD_TYPE_VAR_STRING MYSQL_TYPE_VAR_STRING |
|  |  |
| #define | FIELD_TYPE_STRING MYSQL_TYPE_STRING |
|  |  |
| #define | FIELD_TYPE_CHAR MYSQL_TYPE_TINY |
|  |  |
| #define | FIELD_TYPE_INTERVAL MYSQL_TYPE_ENUM |
|  |  |
| #define | FIELD_TYPE_GEOMETRY MYSQL_TYPE_GEOMETRY |
|  |  |
| #define | FIELD_TYPE_BIT MYSQL_TYPE_BIT |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_CONNECT (unsigned char)(1 << 0) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_TRANS (unsigned char)(1 << 1) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_LOCK_TABLE (unsigned char)(1 << 2) |
|  |  |
| #define | MYSQL_SHUTDOWN_KILLABLE_UPDATE (unsigned char)(1 << 3) |
|  |  |
| #define | SESSION_TRACK_BEGIN SESSION_TRACK_SYSTEM_VARIABLES |
|  | start of enum_session_state_type More... |
|  |  |
| #define | SESSION_TRACK_END SESSION_TRACK_TRANSACTION_STATE |
|  | End of enum_session_state_type. More... |
|  |  |
| #define | IS_SESSION_STATE_TYPE(T) (((int)(T) >= SESSION_TRACK_BEGIN) && ((T) <= SESSION_TRACK_END)) |
|  | is T a valid session state type More... |
|  |  |
| #define | net_new_transaction(net) ((net)->pkt_nr = 0) |
|  |  |
| #define | NET_HEADER_SIZE 4 |
|  | standard header size More... |
|  |  |
| #define | COMP_HEADER_SIZE 3 |
|  | compression header extra size More... |
|  |  |
| #define | NULL_LENGTH ((unsigned long)~0) |
|  | For net_store_length() More... |
|  |  |
| #define | MYSQL_STMT_HEADER 4 |
|  |  |
| #define | MYSQL_LONG_DATA_HEADER 6 |
|  |  |10
