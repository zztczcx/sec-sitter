# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sec_sitter,
  ecto_repos: [SecSitter.Repo],
  event_stores: [SecSitter.EventStore]

# configures Commanded 
config :sec_sitter, SecSitter.App,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: SecSitter.EventStore
  ],
  pub_sub: :local,
  registry: :local

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: SecSitter.Repo



# Configures the endpoint
config :sec_sitter, SecSitterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VqHfuKZWrr36s4LdPWv+LEEFNb6TVI+JX+ROk4UvDzD6x91OyGodQu/R1380qPAN",
  render_errors: [view: SecSitterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SecSitter.PubSub,
  live_view: [signing_salt: "UrgEMNJw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
