defmodule Mysqlex.Connection do
  @moduledoc """
  `DBConnection` callbacks over `Mysqlex.Client`.

  Thin on purpose. The protocol lives in `Mysqlex.Client` and knows nothing about
  `DBConnection`, so this layer can be replaced — or dropped for a hand-written
  pool — without touching anything below it. See decision 15 in
  `docs/decisions.md`.

  The command phase callbacks still return an error; `COM_QUERY` is next.
  """

  use DBConnection

  alias Mysqlex.{Client, Error}

  @impl true
  def connect(opts) do
    case Client.connect(opts) do
      {:ok, %Client{} = client} ->
        {:ok, client}

      {:error, %Error{} = error} ->
        {:error, error}

      # socket failures and unsupported auth methods are not server errors, but
      # DBConnection's contract is an exception either way
      {:error, reason} ->
        {:error, Error.exception(message: "could not connect: #{inspect(reason)}")}
    end
  end

  @impl true
  def disconnect(_reason, %Client{transport: transport, socket: socket}) do
    transport.close(socket)

    :ok
  end

  @impl true
  def checkout(state), do: {:ok, state}

  @impl true
  def ping(state), do: {:ok, state}

  @impl true
  def handle_begin(_opts, state), do: {:error, state}

  @impl true
  def handle_commit(_opts, state), do: {:error, state}

  @impl true
  def handle_rollback(_opts, state), do: {:error, state}

  @impl true
  def handle_status(_opts, state), do: {:idle, state}

  @impl true
  def handle_prepare(_query, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_execute(_query, _params, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_close(_query, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_declare(_query, _params, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_fetch(_query, _cursor, _opts, state), do: {:error, not_implemented(), state}

  @impl true
  def handle_deallocate(_query, _cursor, _opts, state), do: {:error, not_implemented(), state}

  defp not_implemented do
    DBConnection.ConnectionError.exception("Mysqlex does not implement the command phase yet")
  end
end
