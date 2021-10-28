defmodule SecSitterWeb.PageController do
  use SecSitterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
