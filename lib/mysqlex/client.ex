defmodule Mysqlex.Client do
  @moduledoc """
  Reads and writes packets over a `Mysqlex.Transport`.

  This is where the socket lives. Everything it hands upwards is a whole
  message, so no parser above it ever sees a partial read.
  """

  alias Mysqlex.Packet

  @doc """
  Reads one message, reading again for as long as the buffer holds less than a
  whole message.

  `buffer` carries over whatever a previous read left unconsumed, and the
  returned `rest` is what this read left behind.
  """
  def recv_message(transport, socket, buffer, timeout) do
    case Packet.decode_message(buffer) do
      {:ok, sequence_id, message, rest} ->
        {:ok, sequence_id, message, rest}

      :more ->
        case transport.recv(socket, 0, timeout) do
          {:ok, data} -> recv_message(transport, socket, buffer <> data, timeout)
          {:error, reason} -> {:error, reason}
        end
    end
  end
end
