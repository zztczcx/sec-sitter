defmodule SecSitter.Portfolio.Supervisor do
  use Supervisor

  alias SecSitter.Portfolio

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    Supervisor.init(
      [
        Portfolio.Projectors.Share,

        worker(Portfolio.ProcessManagers.ExecuteShareOrder, [], id: :execute_share_order)
      ],
      strategy: :one_for_one
    )
  end
end

