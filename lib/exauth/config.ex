defmodule Exauth.Config do
  def get([]),              do: []
  def get([ head | tail ]), do: [ get(head) | get(tail) ]
  def get(key) do
    Application.get_env(:exauth, key) |> String.to_char_list
  end

  def get_consumer_tuple(method \\ :hmac_sha1) do
    get([:consumer_key, :consumer_secret])
    |> List.insert_at(-1, method)
    |> List.to_tuple
  end
end
