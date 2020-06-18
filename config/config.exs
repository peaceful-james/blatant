# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blatant,
  ecto_repos: [Blatant.Repo]

# Configures the endpoint
config :blatant, BlatantWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yIcLGJRVxD3w0AfrAvcYmsvhd7jFGhgD+7IW2LabeXxaV46IinsXEgwg9qss3c71",
  render_errors: [view: BlatantWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Blatant.PubSub,
  live_view: [signing_salt: "7AQhDufy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
