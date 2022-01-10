import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rafael_store, RafaelStore.Repo,
  username: "postgres",
  password: "postgres",
  database: "rafael_store_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rafael_store, RafaelStoreWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "S7Jc44dvadDh9LUPo4thtYjYmU/gFVlfP1zuaq+lPsozL9lWs1kvDiuLjph1EQej",
  server: false

# In test we don't send emails.
config :rafael_store, RafaelStore.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
