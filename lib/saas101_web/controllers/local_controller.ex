defmodule Saas101Web.LocalController do
  use Saas101Web, :controller

  alias Saas101.Locales
  alias Saas101.Locales.Local

  def index(conn, _params) do
    locales = Locales.list_locales(conn.assigns[:current_tenant])
    render(conn, "index.html", locales: locales)
  end

  def new(conn, _params) do
    changeset = Locales.change_local(%Local{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"local" => local_params}) do
    case Locales.create_local(local_params, conn.assigns[:current_tenant]) do
      {:ok, local} ->
        conn
        |> put_flash(:info, "Local created successfully.")
        |> redirect(to: Routes.local_path(conn, :show, local))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    local = Locales.get_local!(id, conn.assigns[:current_tenant])
    render(conn, "show.html", local: local)
  end

  def edit(conn, %{"id" => id}) do
    local = Locales.get_local!(id, conn.assigns[:current_tenant])
    changeset = Locales.change_local(local)
    render(conn, "edit.html", local: local, changeset: changeset)
  end

  def update(conn, %{"id" => id, "local" => local_params}) do
    local = Locales.get_local!(id, conn.assigns[:current_tenant])

    case Locales.update_local(local, local_params, conn.assigns[:current_tenant]) do
      {:ok, local} ->
        conn
        |> put_flash(:info, "Local updated successfully.")
        |> redirect(to: Routes.local_path(conn, :show, local))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", local: local, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    local = Locales.get_local!(id, conn.assigns[:current_tenant])
    {:ok, _local} = Locales.delete_local(local, conn.assigns[:current_tenant])

    conn
    |> put_flash(:info, "Local deleted successfully.")
    |> redirect(to: Routes.local_path(conn, :index))
  end
end
