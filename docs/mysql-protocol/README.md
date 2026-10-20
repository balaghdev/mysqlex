# MySQL Client/Server Protocol — reference

Local snapshot of the protocol chapter of the MySQL Server developer docs
(<https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_PROTOCOL.html>), converted to
markdown. Each file keeps its upstream doxygen filename and links back to the original
page, so anything ambiguous can be checked against the source.

Pulled 2026-10-20 from the `latest` (8.x) docs.

## Start here

| Page | What it covers |
| --- | --- |
| [Client/Server Protocol](PAGE_PROTOCOL.md) | Top-level overview |
| [Protocol Basics](page_protocol_basics.md) | Packets, data types, response packets, charsets, TLS, compression |
| [Connection Lifecycle](page_protocol_connection_lifecycle.md) | Connection phase → command phase |

## Basics

- [MySQL Packets](page_protocol_basic_packets.md) — 3-byte length + 1-byte sequence id header, packet splitting at 2^24-1
- [Basic Data Types](page_protocol_basic_data_types.md)
  - [Integer Types](page_protocol_basic_dt_integers.md) — fixed-length ints and `int<lenenc>`
  - [String Types](page_protocol_basic_dt_strings.md) — fixed, NUL-terminated, length-encoded, EOF-terminated
- [Generic Response Packets](page_protocol_basic_response_packets.md)
  - [OK_Packet](page_protocol_basic_ok_packet.md)
  - [ERR_Packet](page_protocol_basic_err_packet.md)
  - [EOF_Packet](page_protocol_basic_eof_packet.md)
- [Character Set](page_protocol_basic_character_set.md)
- [TLS](page_protocol_basic_tls.md)
- [Compression](page_protocol_basic_compression.md) / [Compressed Packet](page_protocol_basic_compression_packet.md)
- [Expired Password](page_protocol_basic_expired_passwords.md)

## Connection phase

- [Connection Phase](page_protocol_connection_phase.md) — handshake sequence and capability negotiation
- [Connection Phase Packets](page_protocol_connection_phase_packets.md)
  - [Protocol::Handshake](page_protocol_connection_phase_packets_protocol_handshake.md)
    — [V10](page_protocol_connection_phase_packets_protocol_handshake_v10.md) ·
    [V9](page_protocol_connection_phase_packets_protocol_handshake_v9.md)
  - [Protocol::HandshakeResponse](page_protocol_connection_phase_packets_protocol_handshake_response.md)
  - [Protocol::SSLRequest](page_protocol_connection_phase_packets_protocol_ssl_request.md)
  - [Protocol::AuthSwitchRequest](page_protocol_connection_phase_packets_protocol_auth_switch_request.md) ·
    [AuthSwitchResponse](page_protocol_connection_phase_packets_protocol_auth_switch_response.md) ·
    [OldAuthSwitchRequest](page_protocol_connection_phase_packets_protocol_old_auth_switch_request.md)
  - [Protocol::AuthMoreData](page_protocol_connection_phase_packets_protocol_auth_more_data.md) ·
    [AuthNextFactor](page_protocol_connection_phase_packets_protocol_auth_next_factor_request.md)
- [Authentication Methods](page_protocol_connection_phase_authentication_methods.md)
  - [caching_sha2_password](page_caching_sha2_authentication_exchanges.md) — the 8.0+ default
  - [Clear text client plugin](page_protocol_connection_phase_authentication_methods_clear_text_password.md)
  - [Windows Native Authentication](page_protocol_connection_phase_authentication_methods_authentication_windows.md)
  - [authentication_webauthn](page_webauthn_authentication_exchanges.md)
  - [Multi Factor Authentication](page_protocol_multi_factor_authentication_methods.md)

## Command phase

- [Command Phase](page_protocol_command_phase.md)
- [Text Protocol](page_protocol_command_phase_text.md)
  - [COM_QUERY](page_protocol_com_query.md) → [COM_QUERY Response](page_protocol_com_query_response.md)
    - [Text Resultset](page_protocol_com_query_response_text_resultset.md) ·
      [Column Definition](page_protocol_com_query_response_text_resultset_column_definition.md) ·
      [Row](page_protocol_com_query_response_text_resultset_row.md)
    - [LOCAL INFILE Request](page_protocol_com_query_response_local_infile_request.md) ·
      [Data](page_protocol_com_query_response_local_infile_data.md)
- [Prepared Statements](page_protocol_command_phase_ps.md)
  - [COM_STMT_PREPARE](page_protocol_com_stmt_prepare.md) ·
    [COM_STMT_EXECUTE](page_protocol_com_stmt_execute.md) ·
    [its response](page_protocol_com_stmt_execute_response.md)
  - [COM_STMT_FETCH](page_protocol_com_stmt_fetch.md) ·
    [COM_STMT_SEND_LONG_DATA](page_protocol_com_stmt_send_long_data.md) ·
    [COM_STMT_RESET](page_protocol_com_stmt_reset.md) ·
    [COM_STMT_CLOSE](page_protocol_com_stmt_close.md)
  - [Binary Protocol Resultset](page_protocol_binary_resultset.md) — binary row encoding per column type
- [Utility Commands](page_protocol_command_phase_utility.md) —
  [QUIT](page_protocol_com_quit.md) ·
  [INIT_DB](page_protocol_com_init_db.md) ·
  [PING](page_protocol_com_ping.md) ·
  [RESET_CONNECTION](page_protocol_com_reset_connection.md) ·
  [CHANGE_USER](page_protocol_com_change_user.md) ·
  [SET_OPTION](page_protocol_com_set_option.md) ·
  [STATISTICS](page_protocol_com_statistics.md) ·
  [DEBUG](page_protocol_com_debug.md) ·
  [FIELD_LIST](page_protocol_com_field_list.md)
- [Stored Programs](page_protocol_command_phase_sp.md) — multi-resultset and OUT-param handling

## Constants

- [Capabilities Flags](group__group__cs__capabilities__flags.md) — `CLIENT_*` bitmask
- [Column Definition Flags](group__group__cs__column__definition__flags.md)
- [SERVER_STATUS flags](namespaceclassic__protocol_1_1status_1_1pos.md)
- [field_types.h](field__types_8h.md) — `MYSQL_TYPE_*` column type enum
- [my_command.h](my__command_8h.md) — `COM_*` command byte enum
- [mysql_com.h](mysql__com_8h.md) — the full protocol header (flags, limits, enums)
- [Backward compatibility](group__group__cs__backward__compatibility.md)
- [COM_REFRESH Flags](group__group__cs__com__refresh__flags.md) ·
  [Compression constants](group__group__cs__compresson__constants.md) ·
  [Shutdown/kill constants](group__group__cs__shutdown__kill__constants.md)
- [Client/Server Protocol group index](group__group__cs.md)

## Replication

- [Replication Protocol](page_protocol_replication.md) ·
  [Binlog Event](page_protocol_replication_binlog_event.md) ·
  [Binlog Event Header Flags](group__group__cs__binglog__event__header__flags.md) ·
  [COM_BINLOG_DUMP](page_protocol_com_binlog_dump.md)
