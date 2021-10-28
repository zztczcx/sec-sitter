defmodule SecSitter.App do
  use Commanded.Application, otp_app: :sec_sitter

  router SecSitter.Router
end
