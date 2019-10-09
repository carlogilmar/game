defmodule CocaColaGameWeb.Router do
  use CocaColaGameWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
    plug :put_layout, {CocaColaGameWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CocaColaGameWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", LoginController, :index
    live "/live", FooLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", CocaColaGameWeb do
  #   pipe_through :api
  # end
end
