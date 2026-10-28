defmodule Mysqlex.ClientTest do
  use ExUnit.Case, async: true

  alias Mysqlex.{Client, FakeTransport}

  test "reads a message delivered across several reads" do
    socket = FakeTransport.script([<<5::little-24>>, <<0, "hel">>, "lo"])

    assert {:ok, 0, "hello", ""} =
             Client.recv_message(FakeTransport, socket, "", 1_000)
  end
end
