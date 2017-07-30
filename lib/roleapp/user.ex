defmodule Roleapp.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Doorman.Auth.Bcrypt, only: [hash_password: 1]

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true
    field :role, :string

    timestamps()
  end

  def create_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(email password role))
    |> hash_password
  end
end
