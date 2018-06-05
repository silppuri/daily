require Logger

defmodule Daily.DailyRoomChannel do
  use Phoenix.Channel

  def join("daily:lobby", _message, socket) do
    {:ok, socket}
  end

  def handle_info({:pending}, socket) do
    push socket, "play", %{videoId: Daily.Song.latest_video_id()}
    {:noreply, socket}
  end

  def terminate(_reason, _socket) do
    :ok
  end
end

