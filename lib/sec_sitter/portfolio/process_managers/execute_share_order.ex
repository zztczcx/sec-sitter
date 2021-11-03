defmodule SecSitter.Portfolio.ProcessManagers.ExecuteShareOrder do
  use Commanded.ProcessManagers.ProcessManager,
    name: __MODULE__,
    application: SecSitter.App

  @derive Jason.Encoder

  defstruct [:order_uuid, :status]
  
  alias SecSitter.Portfolio.Commands.{
    ExecuteShareOrder,
    BuyShare,
    SellShare
  }
  alias SecSitter.Portfolio.Events.{
    ShareOrderExecuted,
    ShareBought,
    ShareSold
  }

  alias SecSitter.Accounting.Events.{
    TransactionRecorded
  }

  alias SecSitter.Accounting.Commands.{
    RecordTransaction
  }

  def interested?(%ShareOrderExecuted{order_uuid: order_uuid}),
    do: {:start!, order_uuid}

  def interested?(%ShareBought{order_uuid: order_uuid}),
    do: {:continue!, order_uuid}

  def interested?(%ShareSold{order_uuid: order_uuid}),
    do: {:continue!, order_uuid}

  def interested?(%TransactionRecorded{order_uuid: order_uuid}),
    do: {:stop, order_uuid}


  def handle(%ExecuteShareOrder{}, %ShareOrderExecuted{order_type: "Buy"} = event) do
    %BuyShare{
        share_uuid: event.share_uuid,
        order_uuid: event.order_uuid,
      }
  end

  def handle(%ExecuteShareOrder{}, %ShareOrderExecuted{order_type: "Sell"} = event) do
    %SellShare{
        share_uuid: event.share_uuid,
        order_uuid: event.order_uuid,
      }
  end

  def handle(%ExecuteShareOrder{order_uuid: order_uuid} = order, %BuyShare{} = command) do
    %RecordTransaction{
        share_uuid: command.share_uuid,
        order_uuid: command.order_uuid,
      }
  end

  def handle(%ExecuteShareOrder{order_uuid: order_uuid} = order, %SellShare{} = command) do
    %RecordTransaction{
        share_uuid: command.share_uuid,
        order_uuid: command.order_uuid,
      }
  end

  def apply(%ExecuteShareOrder{} = order, %ShareOrderExecuted{} = event) do
    %ExecuteShareOrder{
        order
        | order_uuid: event.order_uuid
      }
  end
end
