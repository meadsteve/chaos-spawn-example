defmodule ChaosSpawnExample.NumberGenerator do

  @number_service ChaosSpawnExample.NumberService

  def start_link do
    pid = spawn(fn -> loop(100) end)
    {:ok, pid}
  end

  defp loop(interval) do
    initial = @number_service |> ChaosSpawnExample.NumberService.get_number
    IO.puts "Starting with #{initial}"
    loop(initial, interval)
  end

  defp loop(count, interval) do
    @number_service |> ChaosSpawnExample.NumberService.set_number(count)
    :timer.sleep(interval)
    loop(count + 1, interval)
  end
end
