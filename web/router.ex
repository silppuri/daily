defmodule Daily.Router do
  use Daily.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Daily do
    pipe_through :browser # Use the default browser stack

    resources "/", RoomController, only: [:index]
    resources "/rooms", RoomController, only: [:index, :show, :create]
    resources "/song", SongController, only: [:index, :show, :create]
  end
end
