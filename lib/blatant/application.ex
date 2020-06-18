defmodule Blatant.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Blatant.Repo,
      # Start the Telemetry supervisor
      BlatantWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Blatant.PubSub},
      # Start the Endpoint (http/https)
      BlatantWeb.Endpoint
      # Start a worker by calling: Blatant.Worker.start_link(arg)
      # {Blatant.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Blatant.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BlatantWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
