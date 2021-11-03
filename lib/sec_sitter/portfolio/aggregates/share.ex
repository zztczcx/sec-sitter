defmodule SecSitter.Portfolio.Aggregates.Share do
  defstruct uuid: nil,
            ticker: nil,
            unit: 0,
            price: 0,
            brokerage: 0,
            debit: 0,
            credit: 0

  alias __MODULE__
  alias SecSitter.Portfolio.Commands.ExecuteShareOrder 
  alias SecSitter.Portfolio.Events.ShareOrderExecuted

  #buy_share command is routed to this aggregates method
  def execute(
    %Share{uuid: uuid},
    %ExecuteShareOrder{
        order_uuid: order_uuid,
        share_uuid: share_uuid,
        unit: unit,
        price: price,
        ticker: ticker,
        brokerage: brokerage,
        executed_at: executed_at
    }
  ) do
    %ShareOrderExecuted{
        order_uuid: order_uuid,
        share_uuid: share_uuid,
        unit: unit,
        price: price,
        ticker: ticker,
        brokerage: brokerage,
        executed_at: executed_at
    }
  end
  
  def apply(
    %Share{} = share,
    %ShareOrderExecuted{
      share_uuid: share_uuid,
      unit: unit,
      price: price,
      ticker: ticker,
      brokerage: brokerage,
      executed_at: executed_at
    }
  ) do
    %Share{
        share
        | uuid: share_uuid,
          unit: share.unit + unit,
          price: (share.price * share.unit + unit * price) / (share.unit + unit),
          debit: share.debit + unit * price + brokerage,
          brokerage: share.brokerage + brokerage
      }
  end 
end
