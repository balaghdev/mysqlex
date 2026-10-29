defmodule Mysqlex.ClientQueryTest do
  use ExUnit.Case, async: true

  alias Mysqlex.{Client, Error, FakeTransport, Packet}
  alias Mysqlex.Protocol.{HandshakeResponse, Ok}

  defp framed(payload, sequence_id), do: IO.iodata_to_binary(Packet.encode(payload, sequence_id))

  defp client(chunks) do
    socket = FakeTransport.script(chunks)

    %Client{
      transport: FakeTransport,
      socket: socket,
      capabilities: HandshakeResponse.capabilities("mysqlex_test")
    }
  end

  test "sends the statement as command 0x03, starting a new sequence at 0" do
    ok = <<0x00, 1, 42, 0x02, 0x00, 0x00, 0x00>>
    client = client([framed(ok, 1)])

    assert {:ok, %Ok{}, _client} = Client.query(client, "INSERT INTO t VALUES (1)")

    assert FakeTransport.sent(client.socket) ==
             framed(<<0x03, "INSERT INTO t VALUES (1)">>, 0)
  end

  test "returns what the server reports about a write" do
    ok = <<0x00, 1, 42, 0x02, 0x00, 0x00, 0x00>>

    assert {:ok, result, _client} =
             Client.query(client([framed(ok, 1)]), "INSERT INTO t VALUES (1)")

    assert result.affected_rows == 1
    assert result.last_insert_id == 42
  end

  test "returns the server's error for a bad statement" do
    err = <<0xFF, 0x7A, 0x04, ?#, "42S02", "Table 'mysqlex_test.nope' doesn't exist">>

    assert {:error, %Error{} = error, _client} =
             Client.query(client([framed(err, 1)]), "SELECT 1")

    assert error.code == 1146
    assert error.sql_state == "42S02"
  end

  test "does not pretend to understand a resultset yet" do
    # a payload whose first byte is neither 0x00 nor 0xFF is a column count
    column_count = <<0x01>>

    assert {:error, :resultset_not_implemented, _client} =
             Client.query(client([framed(column_count, 1)]), "SELECT 1")
  end
end
