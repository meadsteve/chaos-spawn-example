defmodule ChaosSpawnExample.NumberGenerator do

  @number_service ChaosSpawnExample.NumberService

  def loop(interval \\ 100) do
    IO.puts "Starting loop"
    initial = @number_service |> ChaosSpawnExample.NumberService.get_number
    IO.puts "loading following number from service: #{initial}"
    loop(initial, interval)
  end

  def loop(count, interval) do
    @number_service |> ChaosSpawnExample.NumberService.set_number(count)
    :timer.sleep(interval)
    loop(count + 1, interval)
  end
end
