defmodule LoanyWeb.Router do
  use LoanyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LoanyWeb do
    pipe_through :browser

    get "/", RequestsController, :index

    post "/", RequestsController, :create

    get "/requests/:id/accepted", RequestsController, :accepted
    get "/requests/:id/rejected", RequestsController, :rejected
  end

  # Other scopes may use custom stacks.
  # scope "/api", LoanyWeb do
  #   pipe_through :api
  # end
end
