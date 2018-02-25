defmodule Mysqlex.Tcp do
  def connect(host, port, timeout, opts) do
    socket_opts = [packet: :raw, mode: :binary, active: false] ++ opts
    :gen_tcp.connect(host, port, timeout, opts)
  end

  def recv(socket, bytes) do
    :gen_tcp.recv(socket, bytes)
  end

  def recv(socket, bytes, timeout) do
    :gen_tcp.recv(socket, bytes, timeout)
  end

  def send(socket, packet) do
    :gen_tcp.send(socket, packet)
  end

  def setopts(socket, opts) do
    :inet.setopts(socket, opts)
  end
end
