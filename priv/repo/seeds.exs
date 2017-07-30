Ecto.Adapters.SQL.query!(Roleapp.Repo, "TRUNCATE TABLE users CASCADE")
Roleapp.Repo.insert!(Roleapp.User.create_changeset(%Roleapp.User{}, %{email: "admin@example.com", password: "password", role: "admin"}))
Roleapp.Repo.insert!(Roleapp.User.create_changeset(%Roleapp.User{}, %{email: "operator@example.com", password: "password", role: "operator"}))
