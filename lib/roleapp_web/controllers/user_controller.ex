defmodule RoleappWeb.UserController do
  use RoleappWeb, :controller
  alias Roleapp.User
  alias Roleapp.Repo

  def new(conn, _params) do
    changeset = User.create_changeset(%User{})
    conn |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.create_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn |> redirect(to: "/")
      {:error, changeset} ->
        conn |> render("new.html", changeset: changeset)
    end
  end
end
