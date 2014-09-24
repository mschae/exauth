defmodule Exauth.Mixfile do
  use Mix.Project

  def project do
    [app: :exauth,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     name: "Exauth",
     description: "Wrapper for erlang-oauth",
     package: package,
     deps: deps]
  end

  def application do
    [ mod: { Exauth, [] },
            applications: []]
  end

  defp deps do
    [
      { :oauth, github: "tim/erlang-oauth", tag: "v1.4.0" }
    ]
  end

  defp package do
    [
      contributors: ["Michael Schaefermeyer"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/mschae/exauth" }
    ]
  end
end
