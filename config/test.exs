use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.


# Configure the event store database
config :sec_sitter, SecSitter.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "sec_sitter_eventstore_test",
  hostname: "localhost",
  pool_size: 10

# Configure the read store database
config :sec_sitter, SecSitter.Repo,
  username: "postgres",
  password: "postgres",
  database: "sec_sitter_readstore_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sec_sitter, SecSitterWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
