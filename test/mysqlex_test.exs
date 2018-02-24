defmodule MysqlexTest do
  use ExUnit.Case
  doctest Mysqlex

  test "greets the world" do
    assert Mysqlex.hello() == :world
  end
end
