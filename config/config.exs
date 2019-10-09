# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coca_cola_game,
  ecto_repos: [CocaColaGame.Repo]

# Configures the endpoint
config :coca_cola_game, CocaColaGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RVXcQXfPmWaqL6lmRbXoRSlZcVR4PDc/XMdjC1aMLs97nbw++pBEBApfmPyvNDCm",
  render_errors: [view: CocaColaGameWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CocaColaGame.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "p/+p/im0Xq0syPT/c+Su9p1GsAPwab3N"],
  cloudinary_url: System.get_env("CLOUDINARY_CLOUD"),
  cloudinary_preset: System.get_env("CLOUDINARY_PRESET")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

config :coca_cola_game, CocaColaGame.Guardian,
issuer: "coca_cola_game",
secret_key: "owX6TXttuZ6wg/H3d1a3saIw4aXJbMm0JJwEEWDkYrlv4WeSKNIzfm7vLjuDHL6b"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
