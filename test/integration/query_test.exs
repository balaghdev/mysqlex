defmodule Mysqlex.QueryIntegrationTest do
  use ExUnit.Case, async: false

  @moduletag :integration

  alias Mysqlex.{Client, Error, Tcp}

  # see test/integration/login_test.exs for how to start the server
  @opts [
    hostname: "127.0.0.1",
    port: 3307,
    username: "mysqlex",
    password: "secret",
    database: "mysqlex_test"
  ]

  setup do
    {:ok, client} = Client.connect(@opts)
    on_exit(fn -> Tcp.close(client.socket) end)

    {:ok, _ok, client} = Client.query(client, "DROP TABLE IF EXISTS widgets")

    {:ok, _ok, client} =
      Client.query(
        client,
        "CREATE TABLE widgets (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(20))"
      )

    %{client: client}
  end

  test "reports affected rows and the generated key for an insert", %{client: client} do
    assert {:ok, first, client} =
             Client.query(client, "INSERT INTO widgets (name) VALUES ('first')")

    assert first.affected_rows == 1
    assert first.last_insert_id == 1

    assert {:ok, second, _client} =
             Client.query(client, "INSERT INTO widgets (name) VALUES ('second')")

    assert second.affected_rows == 1
    assert second.last_insert_id == 2
  end

  test "reports rows matched for an update", %{client: client} do
    {:ok, _ok, client} = Client.query(client, "INSERT INTO widgets (name) VALUES ('first')")

    assert {:ok, update, _client} =
             Client.query(client, "UPDATE widgets SET name = 'renamed' WHERE id = 1")

    assert update.affected_rows == 1
    assert update.info =~ "Rows matched: 1"
  end

  test "returns the server's error for a missing table", %{client: client} do
    assert {:error, %Error{} = error, _client} =
             Client.query(client, "SELECT * FROM definitely_missing")

    assert error.code == 1146
    assert error.sql_state == "42S02"
    assert error.message =~ "doesn't exist"
  end

  test "refuses a resultset until it can parse one", %{client: client} do
    assert {:error, :resultset_not_implemented, _client} =
             Client.query(client, "SELECT * FROM widgets")
  end
end
