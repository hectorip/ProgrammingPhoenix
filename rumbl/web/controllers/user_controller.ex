defmodule Rumbl.UserController do
  use Rumbl.Web, :controller
  alias Rumbl.User
  
  def index(conn, _params) do
    users = Rumbl.Repo(User)
    render "index.html", users: users
  end
end