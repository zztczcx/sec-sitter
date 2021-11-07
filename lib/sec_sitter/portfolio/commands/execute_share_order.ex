defmodule SecSitter.Portfolio.Commands.ExecuteShareOrder do
  @enforce_keys [:ticker, :unit, :price]

  defstruct [:order_uuid, :share_uuid, :order_type, :unit, :ticker, :price, :brokrage, :executed_at]

  use ExConstructor

  alias SecSitter.Portfolio.Projections.Share
  alias SecSitter.Portfolio.Commands.ExecuteShareOrder  
  
  @doc """
  Assign a unique identity
  """
  def assign_order_uuid(%ExecuteShareOrder{} = order) do
    uuid = UUID.uuid4()
    %ExecuteShareOrder{order | order_uuid: uuid}
  end

  @doc """
  Assign a unique identity
  """
  def assign_share_uuid(%ExecuteShareOrder{} = order) do
    {:ok, share} = Share 
    |> Ecto.Query.where(ticker: order[:ticker]) 
    |> SecSitter.Repo.one()

    uuid = UUID.uuid4()
    %ExecuteShareOrder{order | share_uuid: uuid}
  end
end
