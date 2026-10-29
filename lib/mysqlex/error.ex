defmodule Mysqlex.Error do
  @moduledoc """
  An error reported by the server.

  `code` is MySQL's own error number and is precise; `sql_state` is the ANSI SQL
  five-character code and is portable across databases. `sql_state` is `nil` when
  the connection did not negotiate `CLIENT_PROTOCOL_41`.
  """

  defstruct [:code, :sql_state, :message]
end
