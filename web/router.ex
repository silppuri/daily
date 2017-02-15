defmodule Daily.Router do
  use Daily.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Daily do
    pipe_through :browser # Use the default browser stack

    resources "/", SongController, only: [:index, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Daily do
  #   pipe_through :api
  # end
end
