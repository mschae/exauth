defmodule ExauthTest do
  use ExUnit.Case

  setup do
    Exauth.configure(
      consumer_key: "consumer_key",
      consumer_secret: "consumer_secret",
      token: "token",
      token_secret: "token_secret"
    )
  end

  test "creates a signature token" do
    assert is_bitstring(Exauth.sign("get", "http://some.url/test"))
  end
end
