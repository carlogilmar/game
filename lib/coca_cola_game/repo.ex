defmodule CocaColaGame.Repo do
  use Ecto.Repo,
    otp_app: :coca_cola_game,
    adapter: Ecto.Adapters.Postgres
end
