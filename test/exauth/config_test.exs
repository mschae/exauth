defmodule Exauth.ConfigTest do
  use ExUnit.Case

  test "sets a valid key" do
    Exauth.Config.set :consumer_key, "consumer_key"

    assert Exauth.Config.get(:consumer_key) == "consumer_key"
  end

  test "sets and gets a list of keys" do
    Exauth.Config.set [consumer_key: "consumer_key",
                       consumer_secret: "consumer_secret"]

    assert Exauth.Config.get([:consumer_key, :consumer_secret]) ==
      ["consumer_key", "consumer_secret"]
  end

  test "gets a oauth copatible tuple" do
    Exauth.Config.set [consumer_key: "consumer_key",
                       consumer_secret: "consumer_secret"]

    assert Exauth.Config.get_consumer_tuple ==
      {'consumer_key', 'consumer_secret', :hmac_sha1}
  end
end
