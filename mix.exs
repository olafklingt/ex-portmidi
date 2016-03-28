defmodule PortMidi.Mixfile do
  use Mix.Project

  def project do
    [app: :portmidi,
     version: "3.0.0",
     elixir: "~> 1.2",
     description: "Elixir bindings to the portmidi C library",
     package: package,
     compilers: [:port_midi, :elixir, :app],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
     mod: {PortMidi, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:credo, "~> 0.3", only: [:dev, :test]},
     {:mock, "~> 0.1.1", only: :test}]
  end

  defp package do
    [maintainers: ["Andrea Rossi"],
     licenses: ["MIT"],
     links: ["https://github.com/lucidstack/ex-portmidi"]]
  end


end

defmodule Mix.Tasks.Compile.PortMidi do
  @shortdoc "Compiles portmidi bindings"
  def run(_) do
    if Mix.shell.cmd("make") != 0 do
      raise Mix.Error, message: "could not run `make`. Do you have make, gcc and libportmidi installed?"
    end
  end
end
