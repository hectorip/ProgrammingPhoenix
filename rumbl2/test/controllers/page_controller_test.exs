defmodule Rumbl2.PageControllerTest do
  use Rumbl2.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello"
  end

  test "GET /hello", %{conn: conn} do
    conn = get conn, "/hello"
    assert text_response(conn, 200) =~ "hello"
  end
end
