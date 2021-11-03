defmodule SecSitter.Portfolio.Commands.SellShare do
  #@enforce_keys [:ticker, :unit, :price]

  defstruct [:order_uuid, :share_uuid, :unit, :ticker, :price, :brokrage, :execute_at]
end
