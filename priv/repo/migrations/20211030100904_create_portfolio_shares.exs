defmodule SecSitter.Repo.Migrations.CreatePortfolioShares do
  use Ecto.Migration

  def change do
    create table(:portfolio_shares, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :ticker, :string
      add :unit, :integer
      add :average_price, :decimal
      add :debit, :decimal
      add :credit, :decimal
      add :brokerage, :decimal
      add :balance, :decimal

      timestamps()
    end

    create(index(:portfolio_shares, [:ticker]))
  end
end
