defmodule BlatantWeb.Router do
  use BlatantWeb, :router

  import Phoenix.LiveDashboard.Router
  import Plug.BasicAuth

  pipeline :autobrowser do
    plug :basic_auth, Application.compile_env(:blatant, :basic_auth)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api
    forward "/", Absinthe.Plug, schema: BlatantWeb.Schema
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).

  scope "/" do
    unless Mix.env() in [:dev, :test] do
      pipe_through :autobrowser
    end
    # TODO @peaceful-james re-enable this protect_from_forgery thing?
    # pipe_through [:fetch_session, :protect_from_forgery]
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BlatantWeb.Schema
    live_dashboard "/dashboard", metrics: BlatantWeb.Telemetry
  end
end
