defmodule RoleappWeb.SessionController do
  use RoleappWeb, :controller
  import Doorman.Login.Session, only: [login: 2, logout: 1]

  def new(conn, _params) do
    conn |> render(:new)
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    if user = Doorman.authenticate(email, password) do
      conn
      |> login(user) # Sets :user_id on conn's session
      |> put_flash(:notice, "Successfully logged in")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:error, "No user found with the provided credentials")
      |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> logout
    |> put_flash(:notice, gettext("You have been logged out"))
    |> redirect(to: "/login")
  end
end
