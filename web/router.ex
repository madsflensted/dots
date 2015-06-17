defmodule Dots.Router do
  use Dots.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Dots do
    pipe_through :browser 

    get "/", PageController, :index
    # get "/board", PageController, :board
    # get "/pad", PageController, :pad
  end

end
