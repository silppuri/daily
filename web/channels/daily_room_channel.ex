require Logger

defmodule Daily.DailyRoomChannel do
  use Phoenix.Channel
  import Ecto.Query

  def join("daily:lobby", message, socket) do
    :timer.send_after(0, {:pending})
    {:ok, socket}
  end

  def handle_info({:pending}, socket) do
    Quantum.add_job("15 11 * * 1-5", fn ->
      push socket, "play", %{videoId: Daily.Song.latest_video_id()}
    end)
    {:noreply, socket}
  end

  def terminate(reason, socket) do
    :ok
  end
end

