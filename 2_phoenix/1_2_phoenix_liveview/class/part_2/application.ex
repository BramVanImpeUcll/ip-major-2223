defmodule Deel2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Deel2.Repo,
      # Start the Telemetry supervisor
      Deel2Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Deel2.PubSub},
      #Phoenix.PubSub.child_spec(name: Deel2.PubSub2),
      %{
        id: Phoenix.PubSub.Supervisor2,
        start: {Phoenix.PubSub.Supervisor, :start_link, [[name: :hi]]},
        type: :supervisor
      },

      # Start the Endpoint (http/https)
      Deel2Web.Endpoint,
      # Start a worker by calling: Deel2.Worker.start_link(arg)
      # {Deel2.Worker, arg}
      {Deel2.MyServer, 0},
      {Deel2.Survivor, nil}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Deel2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Deel2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
