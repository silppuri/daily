# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :daily,
  ecto_repos: [Daily.Repo]

# Configures the endpoint
config :daily, Daily.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ThtGpZIQmZXO9slg7Vc9ukc0ZCQP3WcZFFK71IGw9NdBOaUuqVENquuncRUr2N1/",
  render_errors: [view: Daily.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Daily.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :quantum, Daily.Application,


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
