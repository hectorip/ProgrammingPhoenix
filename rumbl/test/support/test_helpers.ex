defmodule Rumbl.TestHelpers do
  alias Rumbl.Repo

  def inser_user(attrs \\ %{}) do
    changes = Dict.merge(%{
        name: "John Doe",
        username: "user#{Base.encode16(:crypto.rand_bytes(8))}",
        password: "supersecret"
    }, attrs)
    %Rumbl.User{}
      |> Rumbl.User.registration_changeset(changes)
      |> Repo.insert!()
  end

  def insert_video() do
    
  end
end