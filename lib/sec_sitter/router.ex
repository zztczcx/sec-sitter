defmodule SecSitter.Router do
  use Commanded.Commands.Router

  alias SecSitter.Portfolio.Aggregates.Share
  alias SecSitter.Portfolio.Commands.{
    BuyShare,
    SellShare,
    ExecuteShareOrder
  }
  
  dispatch(
    [
      BuyShare,
      SellShare, 
      ExecuteShareOrder
    ], to: Share, identity: :share_uuid)
end
