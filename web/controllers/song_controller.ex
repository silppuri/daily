defmodule Daily.SongController do
  use Daily.Web, :controller
  alias Daily.Song

  def index(conn, _params) do
    urls = Repo.one(from song in Song, order_by: [desc: song.inserted_at], limit: 1, select: [song.url])
    render(conn, "index.html", urls: urls)
  end

  def create(conn, %{"url" => url}) do
    changeset = Song.changeset(%Song{}, Youtube.parse(url))
    case Repo.insert(changeset) do
      {:ok, _url} ->
        conn
        |> put_flash(:info, "Successfully set the #{url} as daily song!")
        |> redirect(to: song_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Could not set the #{url} as daily song!")
        |> redirect(to: song_path(conn, :index))
    end
  end
end
