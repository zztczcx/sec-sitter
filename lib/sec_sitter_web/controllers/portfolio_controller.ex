defmodule SecSitterWeb.PortfolioController do
  use SecSitterWeb, :controller

  alias SecSitter.Portfolio

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
