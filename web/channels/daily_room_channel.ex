require Logger

defmodule Daily.DailyRoomChannel do
  use Phoenix.Channel
  import Ecto.Query

  def join("daily:lobby", message, socket) do
    {:ok, socket}
  end

  def handle_info({:pending}, socket) do
    push socket, "play", %{videoId: Daily.Song.latest_video_id()}
    {:noreply, socket}
  end

  def terminate(reason, socket) do
    :ok
  end
end

