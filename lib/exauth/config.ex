defmodule Exauth.Config do
  @table_name :exauth_config
  @valid_keys [
                :consumer_key, :consumer_secret,
                :token, :token_secret
              ]

  def start do
    if :ets.info(@table_name) == :undefined do
      :ets.new(@table_name, [:named_table])
    end
    :ok
  end

  def set(dict) do
    dict |> Enum.each fn({key, value}) -> set(key, value) end
  end

  def set(key, value) do
    start
    if Enum.member?(@valid_keys, key) do
      :ets.insert(@table_name, {key, value})
    else
      {:error, "Invalid key"}
    end
  end

  def get( [ key ] ),         do: [ get(key) ]
  def get( [ head | tail ] ), do: [ get(head) | get(tail) ]
  def get(key) do
    :ets.lookup(@table_name, key)[key]
  end

  def get_consumer_tuple do
    get([:consumer_key, :consumer_secret])
    |> Enum.map(&String.to_char_list/1)
    |> List.insert_at(-1, :hmac_sha1)
    |> List.to_tuple
  end
end
