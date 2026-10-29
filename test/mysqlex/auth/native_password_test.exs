defmodule Mysqlex.Auth.NativePasswordTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  alias Mysqlex.Auth.NativePassword

  @scramble Base.decode16!("6344555B255D623B3A1E1147626D276F0F4F0B74")

  test "the doubly hashed password is what the server stores" do
    # mysql.user.authentication_string for a native-password account is '*'
    # followed by SHA1(SHA1(password)) in uppercase hex. MySQL 8.4.4 computing
    # it with its own functions returns exactly this.
    assert Base.encode16(NativePassword.stored_hash("secret")) ==
             "14E65567ABDB5135D0CFD9A70B3032C179A49EE7"
  end

  test "produces the expected reply for a known scramble" do
    assert Base.encode16(NativePassword.reply("secret", @scramble), case: :lower) ==
             "ec75977987f3398d9333ef89de2a34c5bded7ca7"
  end

  test "sends nothing at all when the account has no password" do
    assert NativePassword.reply("", @scramble) == ""
  end

  property "a reply is always 20 bytes and changes with the scramble" do
    check all(
            password <- string(:alphanumeric, min_length: 1),
            scramble <- binary(length: 20),
            other <- binary(length: 20),
            scramble != other
          ) do
      reply = NativePassword.reply(password, scramble)

      assert byte_size(reply) == 20
      assert reply != NativePassword.reply(password, other)
    end
  end
end
