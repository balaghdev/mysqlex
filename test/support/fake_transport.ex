defmodule Mysqlex.FakeTransport do
  @moduledoc """
  A transport that replays a scripted list of byte chunks, so framing and the
  connection phase can be driven without a server.

  Each `recv/3` returns the next chunk, which lets a test deliver one packet
  across several reads, or several packets in one read.
  """

  @behaviour Mysqlex.Transport

  def script(chunks) do
    {:ok, agent} = Agent.start_link(fn -> chunks end)
    agent
  end

  @impl true
  def recv(agent, _bytes, _timeout) do
    Agent.get_and_update(agent, fn
      [chunk | rest] -> {{:ok, chunk}, rest}
      [] -> {{:error, :closed}, []}
    end)
  end
end
