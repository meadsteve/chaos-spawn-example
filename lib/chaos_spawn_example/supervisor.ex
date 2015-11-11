defmodule ChaosSpawnExample.Supervisor do
  use Supervisor
  alias ChaosSpawn.Chaotic.ChaoticWorker

  alias ChaosSpawnExample.NumberService
  alias ChaosSpawnExample.NumberGenerator

  @number_service ChaosSpawnExample.NumberService

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      ChaoticWorker.worker(NumberService, [[name: @number_service]]),
      ChaoticWorker.worker(Task, [&NumberGenerator.loop/0])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
