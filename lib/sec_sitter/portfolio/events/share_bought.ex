defmodule SecSitter.Portfolio.Events.ShareBought do
  @derive [Jason.Encoder]

  defstruct [:share_uuid, :unit, :ticker, :price, :brokrage, :executed_at]
end
