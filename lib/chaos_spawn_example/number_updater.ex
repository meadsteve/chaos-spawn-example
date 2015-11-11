defmodule ChaosSpawnExample.NumberUpdater do

  @number_service ChaosSpawnExample.NumberService

  def loop(interval \\ 1000) do
    number = @number_service |> ChaosSpawnExample.NumberService.get_number
    ChaosSpawnExample.Endpoint.broadcast! "count:updates", "updated_count", %{body: number}
    :timer.sleep(interval)
    loop(interval)
  end
end
