defmodule RoleappWeb.Components.RestrictByRole.Helpers do
  alias RoleappWeb.Components.RestrictByRole.View

  def restrict_by_role(assigns) do
    user = assigns[:conn].assigns[:current_user]
    roles = generate_roles(assigns[:roles])
    View.render("index.html", [do: assigns[:do], user: user, roles: roles])
  end

  def restrict_by_role(assigns, do: block) do
    user = assigns[:conn].assigns[:current_user]
    roles = generate_roles(assigns[:roles])
    View.render("index.html", Keyword.merge(assigns, [do: block, user: user, roles: roles]))
  end

  defp generate_roles(roles) when is_list(roles), do: roles
  defp generate_roles(roles) when is_atom(roles) do
    case roles do
      :admin_or_operator -> ["admin", "operator"]
      :admin -> ["admin"]
      :operator -> ["operator"]
      _ -> []
    end
  end
end
