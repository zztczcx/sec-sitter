defmodule SecSitter.Accounting.Events.TransactionRecorded do
  @derive [Jason.Encoder]

  defstruct [:order_uuid, :share_uuid, :unit, :ticker, :price, :brokrage, :executed_at]
end

