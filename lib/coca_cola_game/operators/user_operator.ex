defmodule CocaColaGame.UserOperator do
  @moduledoc """
    User operator definition
  """
  import Ecto.Query, only: [from: 2]
  alias CocaColaGame.Repo
  alias CocaColaGame.User

  def create_user(username, password, role) do
    hash = hash_password(password)
    %User{}
    |> User.changeset(%{username: username, password: hash, role: role})
    |> Repo.insert()
  end

  def get_by_username(username) do
    query =
      from(user in User, where: user.username == ^username)

    query |> Repo.one()
  end

  defp hash_password(password), do: Argon2.hash_pwd_salt(password)

end
