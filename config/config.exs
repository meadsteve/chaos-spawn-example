# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :chaos_spawn_example, ChaosSpawnExample.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "IlgbRH/mTLDqCUO28HEDJO8DFwVJ5+LfCN23XCU7gQWSFsLEdluXLH0/NV3jidoL",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ChaosSpawnExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

### VERY VERY MUCH CHAOS
config :chaos_spawn, :kill_tick, 2000
config :chaos_spawn, :kill_probability, 0.5
