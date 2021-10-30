defmodule SecSitter.Repo.Migrations.CreatePortfolioTransactions do
  use Ecto.Migration

  def change do
    create table(:portfolio_transactions, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :ticker, :string
      add :unit, :integer
      add :order_type, :string

      add :price, :decimal
      add :debit, :decimal
      add :credit, :decimal
      add :brokerage, :decimal
      add :balance, :decimal

      add :reference, :string
      add :detail, :string
      add :executed_at, :utc_datetime

      timestamps()
    end

    create(index(:portfolio_transactions, [:ticker]))
  end
end
