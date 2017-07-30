defmodule RoleappWeb.Router do
  use RoleappWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Doorman.Login.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :require_login do
    plug Roleapp.RequireLogin
  end

  scope "/", RoleappWeb do
    pipe_through :browser # Use the default browser stack
    pipe_through :require_login

    get "/", PageController, :index
    resources "/users", UserController, except: [:show]
  end

  scope "/", RoleappWeb do
    pipe_through :browser

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", RoleappWeb do
  #   pipe_through :api
  # end
end
