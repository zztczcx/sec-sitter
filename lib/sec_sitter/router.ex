defmodule SecSitter.Router do
  use Commanded.Commands.Router

  alias SecSitter.Portfolio.Aggregates.Share
  alias SecSitter.Portfolio.Commands.BuyShare
  alias SecSitter.Portfolio.Commands.SellShare
  
  dispatch([BuyShare], to: Share, identity: :share_uuid)
  dispatch([SellShare], to: Share, identity: :share_uuid)
end
