defmodule Hello.HelloController do
  use Hello.Web, :controller

  def world(conn, %{"name" => name} = paramss) do
    IO.inspect paramss
    render conn, "world.html", name: name
  end
end
