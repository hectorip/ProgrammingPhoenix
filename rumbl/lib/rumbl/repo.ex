defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  alias Rumbl.User
  def all(User) do
    [
      %{id: "1", name: "Héctor Patricio", email:"hectorip@shoelovers.co"},
      %{id: "2", name: "", email:"hectorip@shoelovers.co"},
      %{id: "3", name: "Héctor Patricio", email:"hectorip@shoelovers.co"},
    ]
  end
end
