# Mysqlex

> A native MySQL driver for Elixir

A from-scratch implementation of the MySQL client/server protocol on top of
[`db_connection`](https://hex.pm/packages/db_connection) — no C driver, no
`:mysql` Erlang library.

## Status

Work in progress. The connection phase is partially implemented: the driver
connects over TCP and reads the server's `Protocol::HandshakeV10` packet. The
command phase callbacks return an error until that work lands.

Next steps, roughly in order:

1. Packet layer — `recv_packet`/`send_packet` with sequence-id tracking and the
   16MB continuation rule
2. `Protocol::HandshakeResponse41` and `caching_sha2_password` authentication
3. `OK_Packet` / `ERR_Packet` parsing
4. `COM_QUERY` and the text resultset
5. The remaining `DBConnection` callbacks

## Installation

Not published to Hex yet. To try it from git:

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
