# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pumpkin_assignment_elixir,
  ecto_repos: [PumpkinAssignmentElixir.Repo]

# Configures the endpoint
config :pumpkin_assignment_elixir, PumpkinAssignmentElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZXpfz1AhRPNVDgeq8UB/nOKUHXChuIQ8Ka/Gpf7PiAj/wKisV/ps2BriGkkWtAb1",
  render_errors: [view: PumpkinAssignmentElixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: PumpkinAssignmentElixir.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  config :pumpkin_assignment_elixir, PumpkinAssignmentElixir.Guardian,
  issuer: "pumpkin_assignment_elixir",
  secret_key: "O0YiifE0oJLe33YiOZTmJ0lfKfaDJWT1EUa0DL2NxjBuOyXIx56+V3BnptdQviSG"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
