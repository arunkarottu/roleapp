# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :roleapp,
  ecto_repos: [Roleapp.Repo]

# Configures the endpoint
config :roleapp, RoleappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7bu+Ua9W8CUlojwsBp9cRe+/niuMg54Wc0MVXvp+dTXgMz3LuBytRntVS7vLMWQF",
  render_errors: [view: RoleappWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Roleapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :doorman,
  repo: Roleapp.Repo,
  secure_with: Doorman.Auth.Bcrypt,
  user_module: Roleapp.User

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
