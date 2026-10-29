# Integration tests need a MySQL server; see test/integration for how to start
# one. Run them with: mix test --include integration
ExUnit.configure(exclude: [:integration])
ExUnit.start()
