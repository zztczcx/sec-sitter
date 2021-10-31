defmodule SecSitter.Portfolio do
  @moduledoc """
  The Porfolio context.
  """

  alias SecSitter.App
  alias SecSitter.Portfolio.Commands.BuyShare
  alias SecSitter.Portfolio.Projections.Share

  def buy_share(order_params) do
    uuid = UUID.uuid4()
    dispatch_result = %BuyShare{
      share_uuid: uuid,
      unit: 1,
      ticker: "ANZ",
      price: 24.5,
      brokrage: 2.8,
      executed_at: "2021/10/12",
    } 
    |> App.dispatch()

    case dispatch_result do
      :ok -> 
        {:ok, %Share{uuid: uuid}}
      reply -> reply
    end
  end
  
  def sell_share(order_params) do
  end
end
