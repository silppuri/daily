defmodule Daily.RoomController do
  use Daily.Web, :controller

  def index(conn, _params) do
    rooms = Repo.all(Daily.Room)
    render(conn, "index.html", rooms: rooms)
  end

  def show(conn, params) do
    render(conn, "index.html")
  end
end
