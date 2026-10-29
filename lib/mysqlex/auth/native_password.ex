defmodule Mysqlex.Auth.NativePassword do
  @moduledoc """
  The `mysql_native_password` authentication method.

  A challenge-response scheme: the server sends a random 20-byte scramble in its
  handshake, the client answers with a value derived from both the scramble and
  the password. The password itself never crosses the wire, and because the
  scramble differs per connection the answer cannot be replayed.

  Not the default since MySQL 8 — `caching_sha2_password` is — but it is the
  simplest method to get a connection working, and the server will use it for any
  account created with `IDENTIFIED WITH mysql_native_password`.
  """

  @doc """
  Builds the reply to the server's scramble.

  `SHA1(password) XOR SHA1(scramble <> SHA1(SHA1(password)))`.

  The server holds only `SHA1(SHA1(password))`, which is enough to compute the
  same value and compare, and not enough to recover the password.

  An account with no password answers with no bytes at all rather than with a
  hash of the empty string.
  """
  def reply("", _scramble), do: ""

  def reply(password, scramble) do
    stage1 = :crypto.hash(:sha, password)
    token = :crypto.hash(:sha, scramble <> :crypto.hash(:sha, stage1))

    :crypto.exor(stage1, token)
  end

  @doc """
  `SHA1(SHA1(password))` — what the server keeps in
  `mysql.user.authentication_string`, prefixed there with `*` and hex encoded.
  """
  def stored_hash(password), do: :crypto.hash(:sha, :crypto.hash(:sha, password))
end
