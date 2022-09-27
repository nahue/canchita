defmodule Saas101Web.LayoutView do
  use Saas101Web, :view

  def is_active(conn, path) do
    List.last(conn.path_info) == path
  end

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end
