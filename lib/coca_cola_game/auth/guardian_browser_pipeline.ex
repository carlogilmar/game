defmodule CocaColaGame.Guardian.BrowserPipeline do
  @moduledoc false
  use Guardian.Plug.Pipeline,
    otp_app: :remote_jobs,
    module: CocaColaGame.Guardian,
    error_handler: CocaColaGame.Guardian.ErrorHandler

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
