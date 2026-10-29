defmodule Mysqlex.LoginIntegrationTest do
  use ExUnit.Case, async: false

  @moduletag :integration

  alias Mysqlex.{Client, Error, Tcp}

  # docker run -d --name mysqlex-dev -p 3307:3306 \
  #   -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=mysqlex_test \
  #   mysql:8.0 --mysql-native-password=ON
  #
  # CREATE USER 'mysqlex'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
  # GRANT ALL ON mysqlex_test.* TO 'mysqlex'@'%';
  #
  # MySQL 8.4 ships mysql_native_password disabled, which is why this pins 8.0.
  @opts [
    hostname: "127.0.0.1",
    port: 3307,
    username: "mysqlex",
    password: "secret",
    database: "mysqlex_test"
  ]

  test "logs in to a real server" do
    assert {:ok, client} = Client.connect(@opts)

    on_exit(fn -> Tcp.close(client.socket) end)

    assert client.server_version =~ "8.0"
    assert is_integer(client.connection_id) and client.connection_id > 0
  end

  test "a wrong password is refused in the server's own words" do
    assert {:error, %Error{} = error} = Client.connect(Keyword.put(@opts, :password, "wrong"))

    assert error.code == 1045
    assert error.sql_state == "28000"
    assert error.message =~ "Access denied"
  end

  test "a database the account cannot reach is refused after authentication" do
    assert {:error, %Error{} = error} = Client.connect(Keyword.put(@opts, :database, "nope"))

    # 1044 rather than 1049: the account is granted only mysqlex_test, so the
    # server reports access denied to the database rather than that it is unknown
    assert error.code == 1044
    assert error.sql_state == "42000"
    assert error.message =~ "denied"
  end
end
