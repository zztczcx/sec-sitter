defmodule SecSitter.Portfolio do
  @moduledoc """
  The Porfolio context.
  """

  alias SecSitter.App
  alias SecSitter.Portfolio.Commands.ExecuteShareOrder
  alias SecSitter.Portfolio.Projections.Share

    #uuid = UUID.uuid4()

    #publish_article =
    #  attrs
    #  |> PublishArticle.new()
    #  |> PublishArticle.assign_uuid(uuid)
    #  |> PublishArticle.assign_author(author)
    #  |> PublishArticle.generate_url_slug()

  def execute_share_order(order_params) do
    command =
      order_params
      |> ExecuteShareOrder.new() 
      |> ExecuteShareOrder.assgin_order_uuid()
      |> ExecuteShareOrder.assgin_share_uuid()

    with :ok <- App.dispatch(command) do
      {:ok, %Share{}}
    else
      reply -> reply
    end
  end
end
