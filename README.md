# Mysqlex

> A native MySQL driver for Elixir

A from-scratch implementation of the MySQL client/server protocol on top of
[`db_connection`](https://hex.pm/packages/db_connection) — no C driver, no
`:mysql` Erlang library.

## Talk

This project is the companion to my talk at Functional Conf 2019:
[**Building a MySQL Database Driver in Elixir**](https://www.youtube.com/watch?v=UoxzAPBVuQs)
(FnConf19).

## Status

Work in progress. The connection phase is partially implemented: the driver
connects over TCP and reads the server's `Protocol::HandshakeV10` packet. The
command phase callbacks return an error until that work lands.

The goal is to implement everything in the protocol that can be implemented —
text and binary protocols, every auth plugin, prepared statements, cursors,
transactions, replication — rather than the shortest path to a working query.
An Ecto integration is a someday goal on top of that.

See [ROADMAP.md](ROADMAP.md) for the plan, phase by phase, and for how to pick
this up: local server setup, capturing real packets as test fixtures, and the
reference implementations worth reading.

## Installation

This is a personal project rather than a library, and it is not published to
Hex. To try it from git anyway:

```elixir
def deps do
  [
    {:mysqlex, github: "balaghdev/mysqlex"}
  ]
end
```

## Development

Runtime versions are pinned in `.tool-versions` ([mise](https://mise.jdx.dev) or
asdf):

```bash
mise install          # Erlang 27.3.4.15 + Elixir 1.20.4
mix deps.get
```

```bash
mix test                      # Tests
mix format                    # Format
mix credo --strict            # Lint
mix dialyzer                  # Type check
mix docs                      # Generate docs with ExDoc
mix compile --warnings-as-errors
```

CI runs the same checks across Elixir 1.20.4 (OTP 27 and 28) and 1.17.3.

## Protocol reference

The MySQL protocol documentation this is built against is vendored under
[`docs/mysql-protocol/`](docs/mysql-protocol/README.md) — packet layouts,
capability flags, auth methods and command reference, converted to markdown with
links back to the upstream pages.
