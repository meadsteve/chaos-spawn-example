defmodule ChaosSpawnExample.CountChannel do
  use Phoenix.Channel

  def join("count:updates", _message, socket) do
    {:ok, socket}
  end

end
