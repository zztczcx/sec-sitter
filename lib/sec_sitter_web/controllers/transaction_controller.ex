defmodule SecSitterWeb.TransactionController do
  use SecSitterWeb, :controller

  alias SecSitter.Portfolio
  alias SecSitter.Accounting.Transaction

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def import(conn, %{"csv" => csv}) do
    orders = Transaction.map_csv_to_orders(csv)
    # {
    #  brokerage: "10.000000",
    #  executed_at: "2021-07-15",
    #  order_type: "Buy",
    #  price: "7.000000",
    #  reference: "C12",
    #  ticker: "ZP",
    #  unit: "140"
    # },
    Enum.take(orders, 1)
    |> Portfolio.exexute_share_order

    render(conn, "transactions.json", orders: orders)
  end
end
