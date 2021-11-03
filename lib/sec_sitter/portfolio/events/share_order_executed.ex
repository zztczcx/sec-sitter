defmodule SecSitter.Portfolio.Events.ShareOrderExecuted do
  @derive [Jason.Encoder]

  defstruct [:order_uuid, :order_type, :share_uuid, :unit, :ticker, :price, :brokerage, :executed_at]
end

