defmodule ExauthTest do
  use ExUnit.Case

  test "creates a signature token" do
    assert is_bitstring(Exauth.sign("get", "http://some.url/test"))
  end
end
