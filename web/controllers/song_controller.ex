defmodule Daily.SongController do
  use Daily.Web, :controller
  require Logger

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{"url" => url}) do
    conn
    |> put_flash(:info, "Successfully set the #{url} as daily song!")
    |> render("index.html")
  end
end
