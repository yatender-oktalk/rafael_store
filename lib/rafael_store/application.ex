defmodule RafaelStore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RafaelStore.Repo,
      # Start the Telemetry supervisor
      RafaelStoreWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RafaelStore.PubSub},
      # Start the Endpoint (http/https)
      RafaelStoreWeb.Endpoint
      # Start a worker by calling: RafaelStore.Worker.start_link(arg)
      # {RafaelStore.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RafaelStore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RafaelStoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
