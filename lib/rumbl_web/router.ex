defmodule RumblWeb.Router do
  use RumblWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Rumbl.Auth, repo: Rumbl.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RumblWeb do
    pipe_through :browser # Use the default browser stack
    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", RumblWeb do
  #   pipe_through :api
  # end
  
#   defmodule Rumbl.User do
#     defstruct [:id, :name, :username, :password]
# end
end
