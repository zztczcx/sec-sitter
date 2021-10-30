defmodule SecSitter.Portfolio.Projections.Transaction do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "portfolio_transactions" do
    field(:ticker, :string)
    field(:unit, :integer)

    field(:order_type, :string)
    field(:price, :decimal)

    field(:debit, :decimal)
    field(:credit, :decimal)
    field(:brokerage, :decimal)
    field(:balance, :decimal)

    field(:reference, :string)
    field(:detail, :string)
    field(:executed_at, :utc_datetime)


    timestamps()
  end
end

