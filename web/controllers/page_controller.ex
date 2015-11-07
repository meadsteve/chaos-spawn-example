defmodule ChaosSpawnExample.PageController do
  use ChaosSpawnExample.Web, :controller

  @number_service ChaosSpawnExample.NumberService

  def index(conn, _params) do
    conn
      |> put_flash(:info, "Current count: #{get_count}")
      |> render "index.html"
  end

  defp get_count do
    @number_service |> ChaosSpawnExample.NumberService.get_number
  end

end
