defmodule Saas101Web.CanchaController do
  use Saas101Web, :controller

  alias Saas101.Locales
  alias Saas101.Locales.Local
  alias Saas101.Locales.Cancha

  def index(conn, _params) do
    canchas = Locales.list_canchas(conn.assigns[:current_tenant])
    render(conn, "index.html", canchas: canchas)
  end

  def new(conn, _params) do
    changeset = Locales.change_cancha(%Cancha{})
    locales = Saas101.Repo.all(Local, prefix: conn.assigns[:current_tenant]) |> Enum.map(&{&1.name, &1.id})
    render(conn, "new.html", changeset: changeset, locales: locales)
  end

  def create(conn, %{"cancha" => cancha_params}) do
    case Locales.create_cancha(cancha_params, conn.assigns[:current_tenant]) do
      {:ok, cancha} ->
        conn
        |> put_flash(:info, "Cancha created successfully.")
        |> redirect(to: Routes.cancha_path(conn, :show, cancha))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cancha = Locales.get_cancha!(id, conn.assigns[:current_tenant])
    render(conn, "show.html", cancha: cancha)
  end

  def edit(conn, %{"id" => id}) do
    cancha = Locales.get_cancha!(id, conn.assigns[:current_tenant])
    locales = Saas101.Repo.all(Local, prefix: conn.assigns[:current_tenant]) |> Enum.map(&{&1.name, &1.id})
    changeset = Locales.change_cancha(cancha)
    render(conn, "edit.html", cancha: cancha, changeset: changeset, locales: locales)
  end

  def update(conn, %{"id" => id, "cancha" => cancha_params}) do
    cancha = Locales.get_cancha!(id, conn.assigns[:current_tenant])

    case Locales.update_cancha(cancha, cancha_params, conn.assigns[:current_tenant]) do
      {:ok, cancha} ->
        conn
        |> put_flash(:info, "Cancha updated successfully.")
        |> redirect(to: Routes.cancha_path(conn, :show, cancha))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cancha: cancha, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cancha = Locales.get_cancha!(id, conn.assigns[:current_tenant])
    {:ok, _cancha} = Locales.delete_cancha(cancha, conn.assigns[:current_tenant])

    conn
    |> put_flash(:info, "Cancha deleted successfully.")
    |> redirect(to: Routes.cancha_path(conn, :index))
  end
end
