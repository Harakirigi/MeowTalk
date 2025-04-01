defmodule MeowTalk.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MeowTalkWeb.Telemetry,
      MeowTalk.Repo,
      {DNSCluster, query: Application.get_env(:meow_talk, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MeowTalk.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MeowTalk.Finch},
      # Start a worker by calling: MeowTalk.Worker.start_link(arg)
      # {MeowTalk.Worker, arg},
      # Start to serve requests, typically the last entry
      MeowTalkWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MeowTalk.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MeowTalkWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
