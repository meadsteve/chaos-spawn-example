defmodule ChaosSpawnExample.NumberGenerator do

  def start_link do
    pid = spawn(fn -> loop(100) end)
    {:ok, pid}
  end

  defp loop(interval, count \\ 1) do
    :timer.sleep(interval)
    loop(interval, count + 1)
  end
end
