defmodule Roleapp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :hashed_password, :string
      add :role, :string

      timestamps()
    end

  end
end
