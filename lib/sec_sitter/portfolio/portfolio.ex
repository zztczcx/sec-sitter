defmodule SecSitter.Portfolio do
  @moduledoc """
  The Porfolio context.
  """

  alias SecSitter.App
  alias SecSitter.Portfolio.Commands.BuyShare
  alias SecSitter.Portfolio.Projections.Share

  def buy_share(order_params) do
    command = order_params |> BuyShare.new  
    with :ok <- App.dispatch(command) do
      {:ok, %Share{uuid: uuid}}
    else
      reply -> reply
    end
  end
  
  def sell_share(order_params) do
  end
end
