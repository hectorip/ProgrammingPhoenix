defmodule Rumbl.UserController do
  use Rumbl.Web, :controller
  alias Rumbl.User
  
  def index(conn, _params) do
    users = Rumbl.Repo.all(User)
    render conn, "index.html", users: users
  end
end