defmodule CocaColaGame.Guardian do
  @moduledoc false
  use Guardian, otp_app: :coca_cola_game
	alias CocaColaGame.UserOperator

  def subject_for_token(user, claims) do
		validate(user)
  end

	def validate({:ok, session, claims}) do
		user_id = claims["sub"]
		{:ok, user_id}
	end

	def validate(user) do
		{:ok, user.id}
	end

  def resource_from_claims(claims) do
    id = claims["sub"]
    user = CocaColaGame.UserOperator.get_by_id(id)
    {:ok,  user}
  end
end
