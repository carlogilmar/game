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

  pipeline :browser_pipeline do
    plug CocaColaGame.Guardian.BrowserPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", CocaColaGameWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", LoginController, :index
    get "/logout", LoginController, :logout
    post "/login", LoginController, :login
  end

  scope "/home", CocaColaGameWeb do
    pipe_through [:browser, :browser_pipeline, :ensure_auth]
    live "/", FooLive
  end
end
