require Logger

defmodule Daily.DailyRoomChannel do
  use Phoenix.Channel
  import Ecto.Query

  def join("daily:lobby", message, socket) do
    video_ids = Daily.Repo.one(from song in Daily.Song, order_by: [desc: song.inserted_at], limit: 1, select: [song.video_id])
    :timer.send_after(0, {:play, List.first(video_ids)})
    {:ok, socket}
  end

  def join("daily:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_info({:play, videoId}, socket) do
    Quantum.add_job("* * * * *", fn -> push socket, "play", %{videoId: videoId} end)
    {:noreply, socket}
  end

  def terminate(reason, socket) do
    :ok
  end
end

