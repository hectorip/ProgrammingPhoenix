defmodule Rumbl.UserController do
  use Rumbl.Web, :controller 
  # the fucntion authentica receives a conn and an option and
  # now behaves like a plug
  alias Rumbl.User
  
  # now this function is a plug, look above


  def index(conn, _params) do
    users = Rumbl.Repo.all(User)
    render conn, "index.html", users: users
  end

  def index2(conn, _params) do
    users = Rumbl.Repo.all(User)
    render conn, "index.html", users: users
  end

  def show(conn,  %{"id" => id}) do
    user = Rumbl.Repo.get(User, id)
    render conn, "show.html", user: user
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    case  Repo.insert(changeset) do
      {:ok, user} ->
        conn
          |> Rumbl.Auth.login(user)
          |> put_flash(:info, "#{user.name} has been created!")
          |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        conn
          |> put_flash(:error, "Check the errors below")
          |> render("new.html", changeset: changeset)
    end
  end

end