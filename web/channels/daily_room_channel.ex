defmodule Daily.DailyRoomChannel do
  use Phoenix.Channel

  def join("daily:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("daily:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end

