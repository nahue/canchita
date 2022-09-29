defmodule Saas101Web.HorarioController do
  use Saas101Web, :controller

  alias Saas101.Turnos
  alias Saas101.Turnos.Horario

  def index(conn, _params) do
    horarios = Turnos.list_horarios(conn.assigns[:current_tenant])
    render(conn, "index.html", horarios: horarios)
  end

  def new(conn, _params) do
    changeset = Turnos.change_horario(%Horario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"horario" => horario_params}) do
    case Turnos.create_horario(horario_params, conn.assigns[:current_tenant]) do
      {:ok, horario} ->
        conn
        |> put_flash(:info, "Horario created successfully.")
        |> redirect(to: Routes.horario_path(conn, :show, horario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    horario = Turnos.get_horario!(id, conn.assigns[:current_tenant])
    render(conn, "show.html", horario: horario)
  end

  def edit(conn, %{"id" => id}) do
    horario = Turnos.get_horario!(id, conn.assigns[:current_tenant])
    changeset = Turnos.change_horario(horario)
    render(conn, "edit.html", horario: horario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "horario" => horario_params}) do
    horario = Turnos.get_horario!(id, conn.assigns[:current_tenant])

    case Turnos.update_horario(horario, horario_params, conn.assigns[:current_tenant]) do
      {:ok, horario} ->
        conn
        |> put_flash(:info, "Horario updated successfully.")
        |> redirect(to: Routes.horario_path(conn, :show, horario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", horario: horario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    horario = Turnos.get_horario!(id, conn.assigns[:current_tenant])
    {:ok, _horario} = Turnos.delete_horario(horario, conn.assigns[:current_tenant])

    conn
    |> put_flash(:info, "Horario deleted successfully.")
    |> redirect(to: Routes.horario_path(conn, :index))
  end
end
