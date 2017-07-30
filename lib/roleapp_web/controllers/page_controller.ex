defmodule RoleappWeb.PageController do
  use RoleappWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
