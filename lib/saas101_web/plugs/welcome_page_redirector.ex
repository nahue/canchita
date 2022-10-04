defmodule Saas101Web.Plugs.WelcomePageRedirector do
  alias Saas101Web.Router.Helpers, as: Routes

  def init(default), do: default

  def get_path(conn) do
    if conn.assigns[:current_user] != nil do
      Routes.dashboard_path(conn, :index)
    else
      Routes.login_path(conn, :new)
    end
  end

  def call(conn, _opts) do
    path = get_path(conn)

    IO.inspect(path)

    conn
    |> Phoenix.Controller.redirect(to: path)
    |> Plug.Conn.halt()
  end
end
