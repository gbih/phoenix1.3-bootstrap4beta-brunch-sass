defmodule SasstestWeb.PageController do
  use SasstestWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
