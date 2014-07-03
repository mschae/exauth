defmodule Exauth do
  use Application

  @doc """
  Signs a url with a preconfigured oauth consumer, key, token and secret

  ## Examples
  """
  @spec sign(String.t, String.t) :: String.t
  def sign(method, url), do: sign(method, url, [])

  @spec sign(String.t, String.t, []) :: String.t
  def sign(method, url, params) do
    :oauth.sign(
      normalize_method(method),
      String.to_char_list(url),
      normalize_params(params),
      Exauth.Config.get_consumer_tuple,
      Exauth.Config.get(:token) |> String.to_char_list,
      Exauth.Config.get(:token_secret) |> String.to_char_list
    )
    |> :oauth.header_params_encode
    |> IO.chardata_to_string
  end

  def sign_header(method, url), do: sign_header(method, url, [])
  def sign_header(method, url, params) do
    "OAuth " <> sign(method, url, params)
  end

  def configure(dict) do
    Exauth.Config.set(dict)
  end

  def start(_type, _args) do
    children = [
    ]

    opts = [strategy: :one_for_one, name: Exauth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp normalize_method(method) do
    method |> to_string |> String.upcase |> String.to_char_list
  end

  defp normalize_params(params) do
    params
    |> Enum.map(fn({key, value}) -> {key, String.to_char_list(value)} end)
  end
end
