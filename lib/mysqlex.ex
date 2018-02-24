defmodule Mysqlex do
  @moduledoc """
    MySQL native driver for elixir
  """
  alias Mysqlex.Protocol

  @doc """
    Starts and connect to the mysql server 
    `iex> {:ok, pid} = Mysqlex.start_link(host, port, opts)`
  """

  def start_link(host, port, opts \\ []) do
    opts = [hostname: host, port: port] ++ opts
    DBConnection.start_link(Protocol, opts)
  end
end
