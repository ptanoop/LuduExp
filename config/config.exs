# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :luduExp,
  ecto_repos: [LuduExp.Repo]

# Configures the endpoint
config :luduExp, LuduExpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KqsZjM8bc4GNGY54/Ab1PvpBdU/t/6FJ5IQQOQvrUo1er8FO3p7dFfJlmxAfAX3U",
  render_errors: [view: LuduExpWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LuduExp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


# Configures the Guardian library
config :guardian, Guardian,
  issuer: "LuduExp",
  ttl: { 30, :days },
  allowed_drift: 2000,
  secret_key: "5ecret_k3y",
  serializer: LuduExp.Accounts.GuardianSerializer
