require Logger

defmodule Daily.DailyRoomChannel do
  use Phoenix.Channel
  import Ecto.Query

  def join("daily:lobby", message, socket) do
    :timer.send_after(0, {:pending})
    {:ok, socket}
  end

  def join("daily:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_info({:pending}, socket) do
    Quantum.add_job("15 11 * * *", fn ->
      push socket, "play", %{videoId: Daily.Song.latest_video_id()}
    end)
    {:noreply, socket}
  end

  def terminate(reason, socket) do
    :ok
  end
end

