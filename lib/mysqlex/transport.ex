defmodule Mysqlex.Transport do
  @moduledoc """
  The socket operations the client needs.

  Reading is expressed against this behaviour rather than `:gen_tcp` directly so
  that framing and, later, the connection phase can be driven by a scripted
  transport in tests. `Mysqlex.Tcp` is the real implementation.

  Callbacks are added as the client comes to need them.
  """

  @type socket :: term

  @callback recv(socket, bytes :: non_neg_integer, timeout) :: {:ok, binary} | {:error, term}
end
