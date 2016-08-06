defmodule UserView do
  use Rumbl.Web, :view
  alias Rumbl.User
  def first_name(%User{name: name}) do
    name
      |> Enum.split(" ")
      |> Enum.at(0)
  end
end