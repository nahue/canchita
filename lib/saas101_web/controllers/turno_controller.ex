defmodule Saas101Web.TurnoController do
  use Saas101Web, :controller

  alias Saas101.Turnos
  alias Saas101.Turnos.Turno

  def index(conn, _params) do
    turnos = Turnos.list_turnos(conn.assigns[:current_tenant])
    render(conn, "index.html", turnos: turnos)
  end

  def new(conn, _params) do
    changeset = Turnos.change_turno(%Turno{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"turno" => turno_params}) do
    case Turnos.create_turno(turno_params, conn.assigns[:current_tenant]) do
      {:ok, turno} ->
        conn
        |> put_flash(:info, "Turno created successfully.")
        |> redirect(to: Routes.turno_path(conn, :show, turno))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    turno = Turnos.get_turno!(id, conn.assigns[:current_tenant])
    render(conn, "show.html", turno: turno)
  end

  def edit(conn, %{"id" => id}) do
    turno = Turnos.get_turno!(id, conn.assigns[:current_tenant])
    changeset = Turnos.change_turno(turno)
    render(conn, "edit.html", turno: turno, changeset: changeset)
  end

  def update(conn, %{"id" => id, "turno" => turno_params}) do
    turno = Turnos.get_turno!(id, conn.assigns[:current_tenant])

    case Turnos.update_turno(turno, turno_params, conn.assigns[:current_tenant]) do
      {:ok, turno} ->
        conn
        |> put_flash(:info, "Turno updated successfully.")
        |> redirect(to: Routes.turno_path(conn, :show, turno))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", turno: turno, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    turno = Turnos.get_turno!(id, conn.assigns[:current_tenant])
    {:ok, _turno} = Turnos.delete_turno(turno, conn.assigns[:current_tenant])

    conn
    |> put_flash(:info, "Turno deleted successfully.")
    |> redirect(to: Routes.turno_path(conn, :index))
  end
end
