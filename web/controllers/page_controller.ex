defmodule Dots.PageController do
  use Dots.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  # def pad(conn, _params) do
  #   render conn, "pad.html"
  # end

  # def board(conn, _params) do
  #   render conn, "board.html"
  # end
end
