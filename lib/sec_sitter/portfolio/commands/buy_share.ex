defmodule SecSitter.Portfolio.Commands.BuyShare do
  @enforce_keys [:share_uuid, :ticker, :unit, :price]

  defstruct [:share_uuid, :unit, :ticker, :price, :brokrage, :executed_at]

  use ExConstructor
  use Vex.Struct

  validates(:share_uuid, uuid: true)

end
