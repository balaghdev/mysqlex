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

**The driver connects to a real MySQL server, authenticates, and runs any
statement that returns no rows.** 58 tests with `--include integration`, 50 and
4 excluded without.

- Toolchain current: Erlang 27.3.4.15 / Elixir 1.20.4, `db_connection` 2.10
- Phases 1 and 2 are done; phase 3 has `COM_QUERY` but not resultsets
- No line of the February 2018 code remains. `Mysqlex.Protocol` is deleted; the
  `DBConnection` callbacks now live in `Mysqlex.Connection` as a thin wrapper
  whose state is a `%Mysqlex.Client{}`
- Both 2018 handshake bugs are fixed, and verified against bytes captured from a
  real server: the old pattern raises on MySQL 8.4.4 and parses only when the
  version string happens to be six characters, as 5.7.21's was

What works end to end against MySQL 8.0:

```elixir
{:ok, client} = Client.connect(hostname: "127.0.0.1", port: 3307,
                               username: "mysqlex", password: "secret",
                               database: "mysqlex_test")

{:ok, insert, client} = Client.query(client, "INSERT INTO widgets (name) VALUES ('first')")
insert.affected_rows   # => 1
insert.last_insert_id  # => 1
```

`SELECT` returns `{:error, :resultset_not_implemented, client}` until the
resultset parsers land, which is the next slice.

**CI does not prove the login.** The workflow has no MySQL service, so it runs
the default suite only. A green check means the parsers agree with the spec and
the fixtures, not that a connection succeeded. Adding a `services: mysql:8.0`
leg would close that gap.

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
  `mix compile --warnings-as-errors` clean — CI enforces all four. Gate on the
  exit code, not on filtered output: a pipe into `grep` or `tail` exits 0 even
  when the tests failed.
- **Nothing lands on `master` directly.** Each slice gets a branch and a pull
  request, reviewed before merging.

### How the tests are organised

The module boundaries follow what a test needs, so most of the suite runs
without a database:

| Tier | Needs | Example |
| --- | --- | --- |
| 1 | nothing — pure functions | codecs, framing, auth scrambles |
| 2 | captured bytes in `test/fixtures/` | packet body parsers |
| 3 | a scripted `Mysqlex.Transport` in `test/support/` | the read loop, the connection phase |
| 4 | a real MySQL, tagged `:integration` and excluded by default | queries, prepared statements |

Tier 1 and 2 are where property tests and spec examples go. Where the protocol
documentation includes example bytes, use those rather than hand-built fixtures:
a fixture you author tests the parser against your reading of the spec, which is
how a misreading passes.

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

### 1. Foundation — done

- [x] Frame codec: 3-byte little-endian length + 1-byte sequence id
- [x] Packets larger than 2^24-1: splitting on send, reassembly on receive
- [x] Buffering — a packet can span several TCP reads, or several arrive in one
- [x] `Mysqlex.Transport` behaviour, so reads can be driven without a server
- [x] Codecs: `int<lenenc>`, `string<lenenc>`, `string<NUL>`; `string<EOF>` is
      `rest` and fixed-width fields are inline patterns, so neither needs a function
- [x] `OK_Packet`, `ERR_Packet`, `EOF_Packet`

Deliberately not here:

- Sequence id tracking across a command — it stays a parameter to the codec.
  Done in phase 3, where `Client.query/3` resets it to 0 per command, which is
  the first point at which there was a command to track it across
- The dispatcher that decides whether a payload beginning `0xFE` is an EOF
  packet, an OK standing in for one, or a length-encoded integer. It needs the
  payload length and the command context
- `CLIENT_SESSION_TRACK` in the OK packet — the capability will not be
  advertised until phase 5

### 2. Connection phase — logging in works

- [x] Fix the `HandshakeV10` field parse
- [x] Capability flag negotiation — what the client claims, and what it refuses
- [x] `HandshakeResponse41`
- [x] `mysql_native_password`
- [x] `AuthSwitchRequest` / `AuthSwitchResponse`
- [ ] `AuthMoreData`, needed by `caching_sha2_password`
- [ ] `caching_sha2_password` — fast path, then the full RSA public key path
- [ ] `sha256_password`
- [ ] `SSLRequest` and the TLS upgrade
- [ ] Expired passwords, `AuthNextFactor` (MFA)

Until `caching_sha2_password` lands, a modern server at default settings cannot
be reached — the account has to be created `IDENTIFIED WITH
mysql_native_password`, and MySQL 8.4 ships that plugin disabled. Hence the 8.0
pin in the integration setup.

The server names its *default* plugin in the greeting, before it knows which
account is connecting, and settles the real one with an `AuthSwitchRequest`
afterwards. Refusing on the greeting's plugin rejects logins the server would
have completed. This was found by running against a real server; no scripted test
would have shown it, because a fake only replays what you already believe.

### 3. Text protocol — statements run, rows do not come back yet

- [x] `COM_QUERY`, and the response dispatch on its first byte
- [ ] Text resultset: column count, column definitions, rows, `0xFB` for NULL
- [ ] Decode every `MYSQL_TYPE_*` to an Elixir term — decimal, date/time/datetime,
      JSON, bit, blob, the lot
- [ ] Multi-resultset via `SERVER_MORE_RESULTS_EXISTS`, and `CLIENT_MULTI_STATEMENTS`
- [ ] `LOCAL INFILE` request/data — currently refused outright, since
      `CLIENT_LOCAL_FILES` is not claimed and a server asking the client for a
      file is either broken or hostile

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

Replacing `db_connection` with a hand-written connection and pool is an option
from here, not a prerequisite — see decision 15.

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
