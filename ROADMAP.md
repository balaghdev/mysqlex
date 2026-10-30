# Roadmap

Rough plan. Deliberately not a spec — the order matters more than the detail, and
the detail lives in [`docs/mysql-protocol/`](docs/mysql-protocol/README.md).
Decisions and their reasoning are in [`docs/decisions.md`](docs/decisions.md).

## Goal

Implement everything in the protocol that can be implemented, and then build the
layers above it rather than borrowing them:

- **The whole protocol.** Both text and binary, every auth method, prepared
  statements, cursors, transactions, replication. Not the shortest path to a
  working query.
- **Its own query layer.** A composable query value and a compiler to SQL, rather
  than an Ecto adapter. See "The pivot" below.
- **`db_connection` for pooling only.** It stays for connection lifecycle,
  checkout and the crash-safety discipline that is genuinely hard; nothing above
  the pool depends on it.

Not a published library. Protocol completeness and understanding are the point;
packaging polish is not.

## The pivot

**2026-10-30.** The project now also aims at a domain-oriented structure and its
own query stack, rather than a driver plus an Ecto adapter.

What that changes, honestly separated:

**Genuinely new**

- An explicit connection state machine, so illegal operations are unrepresentable.
  "A resultset is half-read, do not send another command" is a real invariant that
  nothing currently enforces, and it stops being theoretical once cursors exist.
- A `query` context: a composable query value plus a compiler to SQL. This is the
  substance of the pivot.
- `ssl.ex` behind the transport behaviour, which is also what unblocks
  `caching_sha2_password`'s full authentication path.

**Mostly renaming**

- `protocol/` becomes `wire/`; `client.ex` becomes `connection/connection.ex`.
  Worth doing while the code is small; it buys vocabulary, not correctness.

**Deliberately not adopted**

- Repositories. This *is* the persistence mechanism; a repository over packets is
  not a thing.
- Domain events. A strict request/response protocol with no subscribers does not
  need them, and per-row events in a resultset would be actively harmful.
  Telemetry covers the real need.
- Service layers over functions that are already one-liners.

**Reading of "immutability style":** functional core, imperative shell. Encoding
stays pure functions, IO is confined to the transport, and state transitions
return new values.

**Open question for review:** does the compiler emit SQL with interpolated
literals, or SQL with placeholders plus a parameter list? Placeholders need
prepared statements to execute, which is more work and the only version that is
not an injection hole. Current intent is placeholders, with the query layer landing
before prepared statements can run it — so it would be compile-and-inspect before
it is compile-and-execute.

## Target structure

```
lib/mysqlex/
├── wire/                          the wire format
│   ├── packet.ex                  frame
│   ├── codec.ex                   wire types
│   └── packets/                   one module per packet
├── connection/                    the conversation
│   ├── connection.ex              aggregate root
│   ├── phase.ex                   state machine
│   └── transport/                 tcp, ssl
├── query/                         building SQL
│   ├── query.ex  compiler.ex
│   └── fragments/                 from, where, select, join, order, limit
└── result.ex  row.ex  error.ex
```

## Where things stand

**The driver connects to a real MySQL server, authenticates, and runs any
statement that returns no rows.** 58 tests with `--include integration`, 50 and 4
excluded without.

- Toolchain current: Erlang 27.3.4.15 / Elixir 1.20.4, `db_connection` 2.10
- No line of the February 2018 code remains
- Both 2018 handshake bugs are fixed, verified against bytes captured from a real
  server
- CRUD is three letters of four: `INSERT`, `UPDATE`, `DELETE` and DDL all work;
  `SELECT` returns `{:error, :resultset_not_implemented, client}`
- Transaction *statements* already work, since `START TRANSACTION` and `COMMIT`
  answer with OK packets. `DBConnection`'s transaction callbacks are still stubs
- No parameter binding and no escaping helper, so values must be interpolated by
  hand. That is an injection hole by construction and is what the query layer plus
  prepared statements exist to close

**CI does not prove the login.** The workflow has no MySQL service, so a green
check means the parsers agree with the spec and the fixtures, nothing more.

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

Reordered for the pivot. The first item is unchanged and comes first for a
practical reason: every layer above it needs something to read.

### A. Finish the text resultset — next

- [ ] Column count, column definitions, rows, `0xFB` for NULL
- [ ] The `0xFE` disambiguation: EOF packet, an OK standing in for one, or a
      length-encoded integer, decided by payload length
- [ ] Replace the catch-all that currently reports `:resultset_not_implemented`
      for malformed payloads as well as for resultsets
- [ ] Decode every `MYSQL_TYPE_*` to an Elixir term — decimal, the date/time
      family, JSON, bit, blob, unsigned 64-bit, `TINYINT(1)`

This is the largest body of logic in the project and the highest value per hour
on the list: it is what turns a write-only driver into one you can query with.

### B. Restructure

- [ ] `wire/` and `wire/packets/`
- [ ] `connection/` with `Phase` as an explicit state machine
- [ ] `transport/` as the anti-corruption boundary
- [ ] `Result` and `Row` value objects

### C. The query layer

- [ ] A composable query value
- [ ] Fragments: from, select, where, join, order, limit, offset
- [ ] A compiler to SQL plus parameters
- [ ] Decide and record: placeholders or interpolation

### D. Prepared statements

- [ ] `COM_STMT_PREPARE` and its response
- [ ] `COM_STMT_EXECUTE`: parameter binding, type encoding, null bitmap
- [ ] Binary resultset rows
- [ ] `COM_STMT_SEND_LONG_DATA`, `COM_STMT_RESET`, `COM_STMT_CLOSE`
- [ ] Cursors: `CURSOR_TYPE_READ_ONLY` + `COM_STMT_FETCH`
- [ ] Decide: cached per connection?

Where the query layer becomes executable rather than inspectable.

### E. Authentication and TLS

- [ ] `AuthMoreData`
- [ ] `caching_sha2_password` — fast path, then full authentication
- [ ] `ssl.ex` behind the transport behaviour
- [ ] `sha256_password`
- [ ] Expired passwords, `AuthNextFactor` (MFA)

Can float earlier. Until it lands, only accounts created `IDENTIFIED WITH
mysql_native_password` are reachable, and MySQL 8.4 ships that plugin disabled —
hence the 8.0 pin in the integration setup.

### F. Reduce `db_connection` to pooling

- [ ] Transactions and savepoints, `handle_status`
- [ ] Replace the remaining stubs so `DBConnection.execute/3` works
- [ ] Keep nothing above the pool dependent on it

### G. Session and utility commands

- [ ] `COM_PING`, `COM_QUIT`, `COM_INIT_DB`, `COM_RESET_CONNECTION`
- [ ] `COM_CHANGE_USER`, `COM_SET_OPTION`, `COM_STATISTICS`, `COM_DEBUG`,
      `COM_FIELD_LIST`
- [ ] Session state tracking (`SESSION_TRACK_*`)
- [ ] Multi-resultset via `SERVER_MORE_RESULTS_EXISTS`
- [ ] `LOCAL INFILE` — currently refused outright, since `CLIENT_LOCAL_FILES` is
      not claimed and a server asking the client for a file is either broken or
      hostile
- [ ] Compression: zlib, then zstd

### H. Replication

- [ ] `COM_BINLOG_DUMP`
- [ ] Binlog event header and event parsing

### Dropped from the plan

An `Ecto.Adapters.SQL` adapter. The pivot builds the query layer directly, so the
adapter is no longer the destination. It stays possible — the driver would still
satisfy one — but it is not what this is aiming at.

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
