defmodule CocaColaGame.Guardian do
  @moduledoc false
  use Guardian, otp_app: :coca_cola_game

  def subject_for_token(user, _claims) do
    {:ok, 0}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = %{username: ""}
    {:ok,  resource}
  end
end
