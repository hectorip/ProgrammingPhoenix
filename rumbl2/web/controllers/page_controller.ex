defmodule Rumbl2.PageController do
  use Rumbl2.Web, :controller

  def index(conn, _params) do
    name = "Héctor"
    render conn, "index.html", name: name
  end
  def hello(conn, _params) do
    text conn, "hello"
  end
end
