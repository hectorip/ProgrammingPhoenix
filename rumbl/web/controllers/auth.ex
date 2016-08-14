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

end