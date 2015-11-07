defmodule ChaosSpawnExample.NumberService do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_number(server) do
    GenServer.call(server, {:get_number})
  end

  def set_number(server, number) do
    GenServer.cast(server, {:set_number, number})
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, 0}
  end

  def handle_call({:get_number}, _from, number) do
    {:reply, number, number}
  end

  def handle_cast({:set_number, number}, _old_number) do
    {:noreply, number}
  end

end
