defmodule InverseCaptcha.MixProject do
  use Mix.Project

  def project do
    [
      app: :inverse_captcha,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.6-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Inverse Captcha",
      source_url: "https://github.com/savish/aoc2017",
      # The main page in the docs
      docs: [main: "InverseCaptcha", extras: ["README.md"]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end
end
