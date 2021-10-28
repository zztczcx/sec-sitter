defmodule SecSitter.Repo do
  use Ecto.Repo,
    otp_app: :sec_sitter,
    adapter: Ecto.Adapters.Postgres
end
