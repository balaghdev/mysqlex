defmodule Mysqlex.Transport do
  @moduledoc """
  The socket operations the client needs.

  The client is written against this rather than `:gen_tcp` directly so the
  connection phase can be driven by a scripted transport in tests — capability
  negotiation, authentication failures and plugin mismatches are all branches
  that would otherwise need specially configured live servers.

  `Mysqlex.Tcp` is the real implementation. `:ssl` has the same shape, so TLS
  will be another module behind the same behaviour rather than a branch threaded
  through every read and write.
  """

  @type socket :: term

  @callback connect(host :: charlist, port :: :inet.port_number(), opts :: keyword, timeout) ::
              {:ok, socket} | {:error, term}
  @callback recv(socket, bytes :: non_neg_integer, timeout) :: {:ok, binary} | {:error, term}
  @callback send(socket, iodata) :: :ok | {:error, term}
  @callback close(socket) :: :ok
end
