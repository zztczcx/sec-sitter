defmodule SecSitter.Portfolio.Projectors.Share do
  use Commanded.Projections.Ecto,
    application: SecSitter.App,
    name: "Portfolio.Projectors.Share",
    consistency: :strong

  alias SecSitter.Portfolio.Events.ShareBought
  alias SecSitter.Portfolio.Projections.Share

  project(%ShareBought{} = event, _metadata, fn multi ->
      Ecto.Multi.insert(multi, :share_bought, %Share{ticker: "ANZ", uuid: event.share_uuid})
    end
  )
end
