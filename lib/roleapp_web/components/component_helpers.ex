defmodule RoleappWeb.Components.ComponentHelpers do

  def view_opts(namespace) do
    %{root: "lib/roleapp_web/components/#{namespace}",
      namespace: RoleappWeb,
      path: ""}
  end
end
