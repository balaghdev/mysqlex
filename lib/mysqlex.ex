defmodule Mysqlex do
  @moduledoc """
    MySQL native driver for elixir
  """
  alias Mysqlex.Protocol

  @doc """
    Start the connection process and connect to the mysql server 
    
    ## Options

    * `:hostname` - Server hostname
    * `:port` - Server port number
    * `:username` - Db username
    * `:password` - Db password
    * `:database` - database name
    * `:port` - port number of mysql server defaults 3306
  """

  def start_link(hostname, username, password, database, port) do
    opts = [
      hostname: hostname,
      username: username,
      password: password,
      database: database,
      port: 3306
    ]

    DBConnection.start_link(Protocol, opts)
  end
end
