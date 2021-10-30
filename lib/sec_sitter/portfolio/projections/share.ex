defmodule SecSitter.Portfolio.Projections.Share do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "portfolio_shares" do
    field(:ticker, :string)
    field(:unit, :integer, default: 0)

    field(:average_price, :decimal, default: 0)

    field(:debit, :decimal, default: 0)
    field(:credit, :decimal, default: 0)
    field(:brokerage, :decimal, default: 0)
    field(:balance, :decimal, default: 0)

    timestamps()
  end

  #TODO
  #field(:market_value, :decimal, default: 0)
  #field(:profit_loss, :decimal, default: 0)
end
