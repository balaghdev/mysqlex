defmodule Mysqlex.FakeTransport do
  @moduledoc """
  A transport that replays scripted byte chunks and records what was sent, so
  the connection phase can be driven without a server.

  Each `recv/3` hands back the next chunk, which lets a test deliver one packet
  across several reads or several packets in one read.
  """

  @behaviour Mysqlex.Transport

  def script(chunks) do
    {:ok, agent} = Agent.start_link(fn -> %{chunks: chunks, sent: []} end)
    agent
  end

  @doc "Everything the client has written to this socket, in order."
  def sent(agent) do
    agent |> Agent.get(& &1.sent) |> Enum.reverse() |> IO.iodata_to_binary()
  end

  @impl true
  def connect(_host, _port, _opts, _timeout), do: {:error, :use_script_instead}

  @impl true
  def recv(agent, _bytes, _timeout) do
    Agent.get_and_update(agent, fn
      %{chunks: [chunk | rest]} = state -> {{:ok, chunk}, %{state | chunks: rest}}
      %{chunks: []} = state -> {{:error, :closed}, state}
    end)
  end

  @impl true
  def send(agent, data) do
    Agent.update(agent, fn state -> %{state | sent: [data | state.sent]} end)
    :ok
  end

  @impl true
  def close(_agent), do: :ok
end
