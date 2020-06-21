defmodule BlatantWeb.Router do
  use BlatantWeb, :router

  import Phoenix.LiveDashboard.Router
  import Plug.BasicAuth

  pipeline :autobrowser do
    plug :basic_auth, Application.compile_env(:blatant, :basic_auth)
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :basic_auth, Application.compile_env(:blatant, :basic_auth)
  end

  scope "/api" do
    pipe_through :api
    forward "/", Absinthe.Plug, schema: BlatantWeb.Schema
  end

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
