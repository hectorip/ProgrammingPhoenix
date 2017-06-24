defmodule Rumbl2.PageController do
  use Rumbl2.Web, :controller

  def index(conn, _params) do
    text conn, "Updating myself in this"
  end
end
