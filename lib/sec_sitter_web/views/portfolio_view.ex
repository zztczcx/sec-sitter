defmodule SecSitterWeb.PageView do
  use SecSitterWeb, :view

  def render("index.html", assigns) do
    "rendering with assigns #{inspect Map.keys(assigns)}"
  end
end

