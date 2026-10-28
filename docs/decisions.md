# Decision log

Short record of choices made and why, so the reasoning survives the gaps between
working on this. Newest decisions go at the bottom. Entries are not rewritten
when a decision changes — a later entry supersedes an earlier one and says so.

Status values: **settled** (acted on), **provisional** (acted on, revisit when
there is evidence), **open** (not decided yet).

---

### 1. Keep `db_connection` rather than a plain GenServer

**2026-10-20 · settled** · clarified by #15

The driver stays on the `DBConnection` behaviour.

Considered dropping it: the behaviour requires fourteen callbacks, ten of which
are currently stubs, which is a lot of ceremony around what is fundamentally
"send a packet, read some packets."

Decided by the Ecto goal. `ecto_sql` adapters are built on `Ecto.Adapters.SQL`,
which is hardwired to DBConnection — pools, `DBConnection.Ownership`,
`DBConnection.run`, `DBConnection.rollback`. Dropping it would mean rebuilding
all of that later. The stubs are not ceremony; they are the integration surface.

### 2. Implement the whole protocol, not the shortest path to a working query

**2026-10-20 · settled**

`COM_QUERY` plus a text resultset is enough to send any query that can be typed
into the `mysql` client, so a minimal driver could stop there. Not stopping
there. Scope is the full surface: both protocols, every auth plugin, prepared
statements, cursors, transactions, compression, replication.

The point of the project is understanding the protocol, so "do we need this?" is
the wrong question to ask about a protocol feature.

### 3. Not a library, not a Hex package

**2026-10-20 · settled**

Personal project. No Hex publishing, no API stability promises, no compatibility
matrix beyond what CI happens to cover. Effort goes into protocol completeness
instead of packaging. Ecto integration is a someday goal, which does not change
this — an adapter can live here without the driver being a product.

### 4. Pin the toolchain, track current Elixir

**2026-10-20 · settled**

`.tool-versions` pins Erlang 27.3.4.15 and Elixir 1.20.4 (current release at the
time). `mix.exs` requires `~> 1.17`. CI covers 1.20.4 on OTP 27 and 28, plus
1.17.3 as the lower bound.

Erlang 27 rather than 28 locally only because 27 was already installed and mise
builds Erlang from source; no reason beyond that, so moving up is free when
convenient.

### 5. Vendor the protocol docs in the repo

**2026-10-20 · settled**

`docs/mysql-protocol/` holds the protocol chapter of the MySQL Server developer
docs, converted to markdown, each file linking back to its upstream page.

Reason: the thing that stalled this project in 2018 was not knowing where the
answers were. Having the packet layouts one grep away, offline, in the same repo
as the code, removes that failure mode. Upstream pages move; a snapshot does not.

### 6. CI enforces format, lint, warnings and unused deps

**2026-10-20 · settled**

`mix format --check-formatted`, `mix deps.unlock --check-unused`,
`mix compile --warnings-as-errors` and `mix credo --strict` all run in CI, with
the lint checks on one matrix leg only.

Warnings-as-errors is the one that matters: a bitstring parser with an unused
variable is usually a field being silently dropped.

### 7. References are read after writing, never before

**2026-10-20 · settled**

MyXQL, go-sql-driver/mysql, PyMySQL and rust-mysql-common are reference material.
The rule is to implement a piece first and read theirs afterwards, then record
any difference in decision here.

Reading first means implementing someone else's design without having had the
thought, which defeats the purpose. Protocol constants come from the vendored
docs rather than from anyone's source, so licensing never becomes a question.

### 8. Unimplemented callbacks return an error, they do not raise

**2026-10-20 · settled**

The ten stubbed `DBConnection` callbacks return
`DBConnection.ConnectionError.exception("Mysqlex does not implement the command
phase yet")` rather than raising or returning a fake success.

An explicit error at the boundary makes the gap obvious in a stack trace and
keeps the connection alive; a raise inside a callback is noise, and a fake
success is a lie that shows up somewhere unrelated.

### 9. Leave the 2018 handshake field bugs in place for now

**2026-10-20 · settled**

`parse_payload_body/2` reads `server_version` as a fixed 6 bytes where the
protocol says NUL-terminated, and `auth_plugin_data_part_2` as a fixed 13 where
the spec says `MAX(13, len - 8)`. Both are known and deliberately unfixed.

They are the first real protocol work, and phase 1's codecs are what make them
easy to get right. Fixing them by hand first would be fixing them twice. The
mechanical bugs around them — swapped arguments, an unbound `ok` variable — were
fixed, since those blocked a clean build.

### 10. Parsing starts at the frame, and parsers never touch the socket

**2026-10-20 · settled**

First module is `Mysqlex.Packet` with `decode/1` taking a binary and returning
`{:ok, seq, payload, rest}` or `:more`. Socket reads live in a separate layer
that feeds it bytes.

The 2018 code had `parse_header(socket)` doing a `recv` inside the parser. That
single decision made the parsing untestable, required a live MySQL to exercise
one line, and turned a wrong field width into a context-free `MatchError`. Pure
functions over binaries are testable against captured fixtures with no server.

### 11. Module layout follows MyXQL, with per-plugin auth modules

**2026-10-20 · provisional**

Planned shape:

```
lib/mysqlex.ex                public API
lib/mysqlex/packet.ex         framing
lib/mysqlex/protocol/         pure codecs: records, flags, types, values, error_codes
lib/mysqlex/auth/             one module per plugin + dispatch
lib/mysqlex/client.ex         socket + connection phase
lib/mysqlex/connection.ex     DBConnection callbacks
lib/mysqlex/{query,result,error,cursor}.ex
lib/mysqlex/tcp.ex            socket wrapper
```

MyXQL's skeleton because it targets the same behaviour in the same language, and
notably keeps a plain synchronous client separate from the DBConnection wrapper —
so the driver can be built and tested without DBConnection at all. Per-plugin
auth modules follow go-sql-driver, which has one file per plugin behind a
registry; MyXQL keeps auth in one file, but it implements fewer plugins than this
project intends to.

Provisional because none of it is built yet.

### 12. Rename `Mysqlex.Protocol` to `Mysqlex.Connection`

**2026-10-20 · open**

Today `Mysqlex.Protocol` holds the DBConnection callbacks, but every other driver
uses "protocol" for the codec layer. Keeping both meanings will be confusing once
`protocol/` exists as a directory of codecs.

Not done yet. Cheap now at ~130 lines, expensive later.

### 13. Authentication order: `mysql_native_password` before `caching_sha2_password`

**2026-10-20 · settled**

Phase 2 targets `mysql_native_password` first, against a server configured with
`IDENTIFIED WITH mysql_native_password`, even though it is not the MySQL 8
default.

`caching_sha2_password`'s full path needs an RSA public key exchange or TLS.
Starting there turns "connect to a database" into a crypto project, which is one
of the ways this stalled before. A SHA-1 scramble gets a working connection in a
few lines; the real plugin follows once there is something to test it against.

### 14. Test strategy: captured fixtures plus property tests for codecs

**2026-10-20 · settled**

Parser tests run against real packet bytes captured with
`tcpdump -i lo0 -w handshake.pcap port 3306` and saved as binary fixtures, so the
suite needs no live server. Codecs get property tests — encode/decode roundtrips
are the natural property, and catch more than hand-written cases.

Integration tests against a real MySQL come later and stay separate.

The placeholder test asserting `Mysqlex.hello() == :world` was deleted rather than
made to pass; the suite is empty until the first real test.

### 15. Keep `db_connection` now, hand-build a replacement later

**2026-10-28 · settled**

Keep `db_connection` while building the protocol. Once the driver works end to
end, replacing it with a hand-written connection and pool becomes an option —
and a deliberate exercise rather than a prerequisite.

**Correcting #1:** that entry said the Ecto goal settled it. More precisely, Ecto
itself does *not* require DBConnection — `etso`, an ETS-backed adapter, depends on
`ecto` alone and implements `Ecto.Adapter`, `Ecto.Adapter.Schema` and
`Ecto.Adapter.Queryable` directly. What requires DBConnection is
`Ecto.Adapters.SQL`, the helper that supplies most of a SQL adapter. So dropping
DBConnection costs `Ecto.Adapters.SQL`, not Ecto, and the swap stays available in
either direction.

Reason for keeping it now is momentum, not architecture. This project was
abandoned once already. Owning the protocol and a hand-built pool at the same
time means that when a query returns wrong rows, it is unclear whether the row
decoder is wrong or a connection was checked back in with bytes still unread in
its socket buffer — two unproven layers debugged against each other. That is a
good way to stall again.

What DBConnection is worth, concretely: 4,259 lines, of which `holder.ex` (474)
exists to guarantee that a connection whose owner process died is never silently
reused. The protocol-level production problems stay this project's own either
way — error classification, draining half-read resultsets, `max_allowed_packet`,
prepared statement invalidation across reconnects, TLS hostname verification,
sub-binaries holding whole packets alive on the heap.

Consequences:

- The protocol layer must not depend on DBConnection, following MyXQL's split: a
  standalone client that works on its own, with the behaviour as a thin wrapper
  over it. That keeps the swap cheap and keeps the protocol testable without any
  pooling in the picture.
- Start with a single connection and no concurrency, so that every bug during the
  protocol phases is a protocol bug by construction. Pooling becomes its own phase
  afterwards.
- The stubbed callbacks from #8 stay — they compile, and they document the gap.

---

## Open questions

Recorded so they are not re-derived from scratch later.

- **Packets as records or structs?** MyXQL uses Erlang records, because records
  compile to tuples and pattern-match more cheaply than struct maps in a hot
  path. Worth copying, but worth measuring rather than assuming.
- **Lazy or eager row decoding?** Decode rows as they are parsed, or hand back
  raw binaries and decode on access.
- **Cache prepared statements per connection?** MySQL scopes them per connection
  and counts them against `max_prepared_stmt_count`, so caching has a ceiling.
- **How much of the type-decoding surface is worth doing before cursors?** Type
  codecs are the largest body of real logic in every driver surveyed.
