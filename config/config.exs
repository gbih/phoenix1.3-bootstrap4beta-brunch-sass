# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :sasstest, SasstestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jri0zHRsarBvaiWX1EE13naDA8IV6QNjc3FmwQg86q33oo1g6yxXrGyFeNfdmOvI",
  render_errors: [view: SasstestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sasstest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
