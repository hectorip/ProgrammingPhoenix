defmodule Rumbl.Auth do

  import Plug.Conn

  # A Plug must have a init function that is run at compile time
  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  # A plug also must have a call function that receives options
  # and is run at runtime
  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(Rumbl.User, user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true) # Renews cookie to avoid atacks
  end
  def login_by_username_and_pass(conn, username, pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(Rumbl.User, username: username)

    cond do
      user && checkpw(pass, user.password_hash) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

end