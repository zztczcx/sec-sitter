defmodule SecSitterWeb.TransactionController do
  use SecSitterWeb, :controller

  alias SecSitter.Portfolio
  alias SecSitter.Portfolio.Projections.Share

  def new(conn, _params) do
    render(conn, "new.html")
  end

#[
#  ok: %{
#    "Balance($)" => "0.00",
#    "Credit($)" => "",
#    "Date" => "07/09/2021",
#    "Debit($)" => "1980.05",
#    "Details" => "Direct Transfer - Payee MR",
#    "Reference" => "P"
#  },
#  ok: %{
#    "Balance($)" => "-1980.05",
#    "Credit($)" => "1980.05",
#    "Date" => "03/09/2021",
#    "Debit($)" => "",
#    "Details" => "S 80000 GTR @ 0.025000",
#    "Reference" => "C"
#  }
#]
  def import(conn, %{"csv" => csv}) do
    orders =
      csv
      |> decode_csv
      |> Enum.filter(&sell_or_buy?/1)
      |> Enum.map(&parse_order/1)

    render(conn, "transactions.json", orders: orders)
  end

  # return type is a steam 
  # Stream<[
  #  enum: #Function<59.58486609/2 in Stream.transform/3>,
  #  funs: [#Function<47.58486609/1 in Stream.map/2>]
  # ]>
  defp decode_csv(file) do
    "#{file.path}"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(fn {:ok, order} -> order end)
  end

  defp sell_or_buy?(order) do
    filter_order(order["Details"])
  end

  defp filter_order("S"<>_), do: true
  defp filter_order("B"<>_), do: true
  defp filter_order(_), do: false

  defp parse_order(order) do
    [type, unit, ticker, "@", price] = order["Details"]
    |> String.split(" ")

    %{
      ticker: ticker,
      unit: unit,
      order_type: convert_order_type(type),
      price: Decimal.new(price),
      reference: order["Reference"],
      executed_at: convert_date(order["Date"])
    }
  end

  # parse from dd/mm/yyyy
  defp convert_date(date_string) do
    [day, month, year]= date_string
    |> String.split("/")
    |> Enum.map(&String.to_integer/1)

    {:ok, date} = Date.new(year, month, day)
    date
  end

  defp convert_order_type("S"), do: "Sell"
  defp convert_order_type("B"), do: "Buy"
end
