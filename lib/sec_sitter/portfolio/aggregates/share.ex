defmodule SecSitter.Portfolio.Aggregates.Share do
  defstruct uuid: nil,
            ticker: nil,
            unit: 0,
            price: 0,
            brokrage: 0,
            debit: 0,
            credit: 0

  alias __MODULE__
  alias SecSitter.Portfolio.Commands.BuyShare 
  alias SecSitter.Portfolio.Events.ShareBought

  def execute(
    %Share{uuid: nil},
    %BuyShare{
        share_uuid: share_uuid,
        unit: unit,
        price: price,
        ticker: ticker,
        brokrage: brokrage,
        executed_at: executed_at
    }
  ) do
    %ShareBought{
        share_uuid: share_uuid,
        unit: unit,
        price: price,
        ticker: ticker,
        brokrage: brokrage,
        executed_at: executed_at
    }
  end
  
  def apply(
    %Share{} = share,
    %ShareBought{
      share_uuid: share_uuid,
      unit: unit,
      price: price,
      ticker: ticker,
      brokrage: brokrage,
      executed_at: executed_at
    }
  ) do
    %Share{
        share
        | uuid: share_uuid,
          unit: share.unit + unit,
          price: (share.price * share.unit + unit * price) / (share.unit + unit),
          debit: share.debit + unit * price + brokrage,
          brokrage: share.brokrage + brokrage
      }
  end 
end
