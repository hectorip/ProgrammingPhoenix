defmodule Rumbl2.PageController do
  use Rumbl2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
