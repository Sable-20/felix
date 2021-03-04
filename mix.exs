defmodule Felix.MixProject do
  use Mix.Project

  def project do
    [
      app: :felix,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Felix, []}
    ]
  end

  defp aliases do
    [test: "test --no-start"]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
  [
    {:alchemy, "~> 0.6.8", hex: :discord_alchemy},
  ]
  end
end
