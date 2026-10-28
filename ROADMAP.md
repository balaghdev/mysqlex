# Roadmap

Rough plan for implementing the MySQL client/server protocol. Deliberately not a
spec — the order matters more than the detail, and the detail lives in
[`docs/mysql-protocol/`](docs/mysql-protocol/README.md).

## Goal

Implement everything in the protocol that can be implemented, not the minimum
path to a working query. Eventually an Ecto integration on top. Not a published
library — this is a personal project, so protocol completeness and understanding
are the point, and packaging polish is not.

Decisions made along the way are recorded in
[docs/decisions.md](docs/decisions.md), including the ones still open.

## Where things stand

- Toolchain current: Erlang 27.3.4.15 / Elixir 1.20.4, `db_connection` 2.10, CI green
- `Mysqlex.Protocol` connects over TCP and reads the server's `Protocol::HandshakeV10`
- Everything else is a stub that returns `DBConnection.ConnectionError`
- Test suite is empty — the first real test starts phase 1

**Known broken, fix first:** `parse_payload_body/2` reads `server_version` as a
fixed 6 bytes, but the protocol says NUL-terminated; `auth_plugin_data_part_2` is
fixed at 13 bytes where the spec says `MAX(13, len - 8)`. Both are in
`lib/mysqlex/protocol.ex` and both are the kind of thing phase 1's codecs make
easy to get right.

## How to work on this

- **Test first, one piece at a time.** Smallest thing that passes, then the next.
- **Capture real bytes as fixtures.** `tcpdump -i lo0 -w handshake.pcap port 3306`,
  connect with the stock `mysql` client, read it in Wireshark (its MySQL dissector
  labels every field). Save captured packets as binary fixtures so parser tests
  need no live server.
- **Write before reading a reference.** Implement a piece, *then* diff your
  decisions against a production driver. Reading first means implementing someone
  else's design without having had the thought.
- Keep `mix format`, `mix credo --strict`, `mix dialyzer` and
  `mix compile --warnings-as-errors` clean — CI enforces all four.

### Local server

```bash
docker run --rm -d --name mysqlex-dev -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=mysqlex_test mysql:8
```

For phase 2, start against `mysql_native_password` so auth is a SHA-1 scramble
rather than an RSA key exchange:

```sql
CREATE USER 'mysqlex'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
GRANT ALL ON mysqlex_test.* TO 'mysqlex'@'%';
```

## Phases

Each phase should end somewhere runnable.

### 1. Foundation

- [ ] `recv_packet` / `send_packet`: 3-byte little-endian length + 1-byte sequence id
- [ ] Sequence id tracking, and resetting it per command
- [ ] Packets larger than 2^24-1: splitting on send, reassembly on receive
- [ ] Buffering — a packet can span several TCP reads
- [ ] Codecs: `int<lenenc>`, `string<lenenc>`, `string<NUL>`, `string<EOF>`, fixed ints
- [ ] `OK_Packet`, `ERR_Packet`, `EOF_Packet`, including the `CLIENT_DEPRECATE_EOF` form

### 2. Connection phase

- [ ] Fix the `HandshakeV10` field parse
- [ ] Capability flag negotiation — decide what the client claims
- [ ] `HandshakeResponse41`
- [ ] `mysql_native_password` (get connected first)
- [ ] `AuthSwitchRequest` / `AuthSwitchResponse` / `AuthMoreData`
- [ ] `caching_sha2_password` — fast path, then the full RSA public key path
- [ ] `sha256_password`
- [ ] `SSLRequest` and the TLS upgrade
- [ ] Expired passwords, `AuthNextFactor` (MFA)

### 3. Text protocol

- [ ] `COM_QUERY`
- [ ] Text resultset: column count, column definitions, rows, `0xFB` for NULL
- [ ] Decode every `MYSQL_TYPE_*` to an Elixir term — decimal, date/time/datetime,
      JSON, bit, blob, the lot
- [ ] Multi-resultset via `SERVER_MORE_RESULTS_EXISTS`, and `CLIENT_MULTI_STATEMENTS`
- [ ] `LOCAL INFILE` request/data

### 4. Binary protocol and prepared statements

- [ ] `COM_STMT_PREPARE` and its response (param + column definitions)
- [ ] `COM_STMT_EXECUTE`: parameter binding, type encoding, null bitmap
- [ ] Binary resultset rows
- [ ] `COM_STMT_SEND_LONG_DATA`, `COM_STMT_RESET`, `COM_STMT_CLOSE`
- [ ] Cursors: `CURSOR_TYPE_READ_ONLY` + `COM_STMT_FETCH`
- [ ] Decide: are prepared statements cached per connection?

### 5. Session and utility commands

- [ ] `COM_PING`, `COM_QUIT`, `COM_INIT_DB`, `COM_RESET_CONNECTION`
- [ ] `COM_CHANGE_USER`, `COM_SET_OPTION`, `COM_STATISTICS`, `COM_DEBUG`, `COM_FIELD_LIST`
- [ ] Session state tracking (`SESSION_TRACK_*` in the OK packet)
- [ ] Compression: zlib, then zstd

### 6. Complete the DBConnection behaviour

Each stub in `lib/mysqlex/protocol.ex` maps onto protocol work above:

| Callback | Implemented by |
| --- | --- |
| `handle_prepare` / `handle_execute` / `handle_close` | phase 4 |
| `handle_declare` / `handle_fetch` / `handle_deallocate` | phase 4 cursors (`Repo.stream`) |
| `handle_begin` / `handle_commit` / `handle_rollback` | transactions + savepoints |
| `ping` / `disconnect` | `COM_PING` / `COM_QUIT` |

- [ ] Transactions and savepoints, `handle_status`
- [ ] Replace the remaining stubs

### 7. Replication

- [ ] `COM_BINLOG_DUMP`
- [ ] Binlog event header and event parsing

### Later: Ecto

Out of scope for now, and worth knowing it is two jobs. The driver is this
project; an `Ecto.Adapters.SQL` adapter also needs a SQL-generation module that
turns Ecto queries into MySQL SQL. That half is query compilation rather than
protocol, and is comparable in size.

## References

Used as learning devices, not sources to copy from. Protocol constants come from
the vendored docs, which are facts from the spec.

| Project | Good for |
| --- | --- |
| [myxql](https://github.com/elixir-ecto/myxql) (Apache-2.0) | Design questions: client state machine, query/result structs, error modeling. Same language, same `db_connection` base, and what `Ecto.Adapters.MyXQL` wraps |
| [go-sql-driver/mysql](https://github.com/go-sql-driver/mysql) (MPL-2.0) | Protocol mechanics. Different language, so ideas have to be re-expressed rather than lifted. Note MPL is file-level copyleft |
| [PyMySQL](https://github.com/PyMySQL/PyMySQL) (MIT) | `caching_sha2_password` specifically — compact and readable |
| [rust-mysql-simple](https://github.com/blackbeam/rust-mysql-simple) (Apache-2.0) | Type mapping edge cases; a typed language has to be explicit about every column type |
| Wireshark's MySQL dissector | Ground truth. Beats reading anyone's source |
