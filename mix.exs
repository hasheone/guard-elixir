defmodule HasheGuard.MixProject do
  use Mix.Project

  def project do
    [
      app: :hashe_guard,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:joken, "~> 2.3"}
    ]
  end
end
