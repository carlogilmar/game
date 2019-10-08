defmodule CocaColaGameWeb.PageController do
  use CocaColaGameWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
