defmodule Rumbl.RepoOld do
  # use Ecto.Repo, otp_app: :rumbl
  # alias Rumbl.User
  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Luffy", email: "luffy@strawhat.co"},
      %Rumbl.User{id: "2", name: "Zoro", email: "hectorip@shoelovers.co"},
      %Rumbl.User{id: "3", name: "Sanji", email: "hectorip@shoelovers.co"},
    ]
  end 

  def all(_module) do
    []
  end

  def get(module, id) do
    Enum.find all(module), fn el -> el.id == id end
  end

  def get_by(module, params) do
    Enum.filter all(module), fn el ->
      Enum.all? params, fn {key, value} -> Map.get(el, key) == value end
    end
  end
end
