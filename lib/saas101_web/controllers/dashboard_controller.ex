defmodule Saas101Web.DashboardController do
  use Saas101Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
