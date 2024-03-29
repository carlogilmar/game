defmodule CocaColaGame.Repo.Migrations.AddUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :serial, primary_key: true
      add :username, :string
      add :role, :string
      add :password, :string
      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
