defmodule Roleapp.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Roleapp.User


  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :hashed_password, :role])
    |> validate_required([:email, :hashed_password, :role])
  end
end
