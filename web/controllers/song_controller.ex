require Logger

defmodule Daily.SongController do
  use Daily.Web, :controller

  alias Daily.Song

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{"url" => url}) do
    changeset = Song.changeset(%Song{}, %{url: url})
    case Repo.insert(changeset) do
      {:ok, _url} ->
        conn
        |> put_flash(:info, "Successfully set the #{url} as daily song!")
        |> render("index.html")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Could not set the #{url} as daily song!")
        |> render("index.html", changeset: changeset)
    end
  end
end
