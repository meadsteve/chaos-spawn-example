defmodule ChaosSpawnExample.Supervisor do
  use Supervisor
  alias ChaosSpawn.Chaotic.ChaoticWorker

  alias ChaosSpawnExample.NumberService
  alias ChaosSpawnExample.NumberGenerator
  alias ChaosSpawnExample.NumberUpdater

  @number_service ChaosSpawnExample.NumberService

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      ChaoticWorker.worker(NumberService, [[name: @number_service]]),
      ChaoticWorker.worker(Task, [&NumberGenerator.loop/0], id: NumberGenerator),
      ChaoticWorker.worker(Task, [&NumberUpdater.loop/0], id: NumberUpdater)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
