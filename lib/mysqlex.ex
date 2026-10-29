defmodule Mysqlex do
  @moduledoc """
  MySQL native driver for Elixir.
  """

  alias Mysqlex.Connection

  @doc """
  Start the connection process and connect to the MySQL server.

  ## Options

    * `:hostname` - Server hostname
    * `:username` - DB username
    * `:password` - DB password
    * `:database` - Database name
    * `:port` - Port number of the MySQL server, defaults to 3306
  """
  def start_link(hostname, username, password, database, port \\ 3306) do
    opts = [
      hostname: hostname,
      username: username,
      password: password,
      database: database,
      port: port
    ]

    DBConnection.start_link(Connection, opts)
  end
end
