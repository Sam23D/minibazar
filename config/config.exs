# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mini_bazar,
  ecto_repos: [MiniBazar.Repo]

# Configures the endpoint
config :mini_bazar, MiniBazarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t/0X3n9iMjYyAkCh+23iyENH46gTxhL+WUwPXljcBM7bvCCfCdlPg3P8o6VIFIpW",
  render_errors: [view: MiniBazarWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MiniBazar.PubSub,
  live_view: [signing_salt: "OdAi4Jb4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
