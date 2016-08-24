defmodule Rumbl.SessionController do
  use Rumbl.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end
  def create(conn, _params = %{"session" => %{"username" => user, "password" => pass}}) do
    case Rumbl.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do

      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid usename-password cobination")
        |> render("new.html")

    end
  end

  def delete(conn, _params) do
    conn
      |> Rumbl.Auth.logout()
      |> redirect(to: page_path(conn, :index))
  end
end