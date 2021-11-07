defmodule SecSitterWeb.TransactionView do
  use SecSitterWeb, :view

  def render("transactions.json", %{orders: orders}) do
    orders
  end
end
