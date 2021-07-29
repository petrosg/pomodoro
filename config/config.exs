# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pomodoro,
  ecto_repos: [Pomodoro.Repo]

# Configures the endpoint
config :pomodoro, PomodoroWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YlHva5uQUy7ca3r5QyeXew96UPRVt0VTzIq3l6+Y1MUtFeNSrofOvnHOuAwM7AuG",
  render_errors: [view: PomodoroWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pomodoro.PubSub,
  live_view: [signing_salt: "djasE7hY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
