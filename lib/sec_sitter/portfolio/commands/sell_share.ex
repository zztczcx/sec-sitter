defmodule SecSitter.Portfolio.Commands.SellShare do
  @enforce_keys [:ticker, :unit, :price]

  defstruct [:unit, :ticker, :price, :brokrage, :execute_at]
end
