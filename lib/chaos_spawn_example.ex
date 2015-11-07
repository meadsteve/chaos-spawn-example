defmodule ChaosSpawnExample do
  use Application

  @number_service ChaosSpawnExample.NumberService

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    alias ChaosSpawn.Chaotic.ChaoticWorker


    children = [
      # Start the endpoint when the application starts
      supervisor(ChaosSpawnExample.Endpoint, []),

      ChaoticWorker.worker(ChaosSpawnExample.NumberService, [[name: @number_service]]),
      ChaoticWorker.worker(ChaosSpawnExample.NumberGenerator, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChaosSpawnExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChaosSpawnExample.Endpoint.config_change(changed, removed)
    :ok
  end
end
