defmodule Mysqlex.Tcp do
  @moduledoc """
  Thin wrapper around `:gen_tcp` for the connection's socket.
  """

  @socket_opts [packet: :raw, mode: :binary, active: false]

  def connect(host, port, opts \\ [], timeout \\ 5_000) do
    :gen_tcp.connect(host, port, @socket_opts ++ opts, timeout)
  end

  def recv(socket, bytes, timeout \\ :infinity) do
    :gen_tcp.recv(socket, bytes, timeout)
  end

  def send(socket, packet) do
    :gen_tcp.send(socket, packet)
  end

  def close(socket) do
    :gen_tcp.close(socket)
  end

  def setopts(socket, opts) do
    :inet.setopts(socket, opts)
  end
end
