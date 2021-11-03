defmodule SecSitter.Portfolio.Events.ShareBought do
  @derive [Jason.Encoder]

  defstruct [:order_uuid, :share_uuid, :unit, :ticker, :price, :brokerage, :executed_at]
end
