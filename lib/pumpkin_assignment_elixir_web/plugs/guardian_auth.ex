defmodule PumpkinAssignmentElixirWeb.Plugs.GuardianAuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :jewellery_shop,
    module: PumpkinAssignmentElixir.Guardian,
    error_handler: PumpkinAssignmentElixirWeb.Plugs.AuthErrorHandler

  plug(Guardian.Plug.VerifyHeader)
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource, ensure: true)
end
