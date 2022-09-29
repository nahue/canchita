defmodule Saas101Web.ReservationController do
  use Saas101Web, :controller

  alias Saas101.Reservations
  alias Saas101.Reservations.Reservation

  def index(conn, _params) do
    reservations = Reservations.list_reservations(conn.assigns[:current_tenant])
    render(conn, "index.html", reservations: reservations)
  end

  def new(conn, _params) do
    changeset = Reservations.change_reservation(%Reservation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"reservation" => reservation_params}) do
    case Reservations.create_reservation(reservation_params, conn.assigns[:current_tenant]) do
      {:ok, reservation} ->
        conn
        |> put_flash(:info, "Reservation created successfully.")
        |> redirect(to: Routes.reservation_path(conn, :show, reservation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    reservation = Reservations.get_reservation!(id, conn.assigns[:current_tenant])
    render(conn, "show.html", reservation: reservation)
  end

  def edit(conn, %{"id" => id}) do
    reservation = Reservations.get_reservation!(id, conn.assigns[:current_tenant])
    changeset = Reservations.change_reservation(reservation)
    render(conn, "edit.html", reservation: reservation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "reservation" => reservation_params}) do
    reservation = Reservations.get_reservation!(id, conn.assigns[:current_tenant])

    case Reservations.update_reservation(reservation, reservation_params, conn.assigns[:current_tenant]) do
      {:ok, reservation} ->
        conn
        |> put_flash(:info, "Reservation updated successfully.")
        |> redirect(to: Routes.reservation_path(conn, :show, reservation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", reservation: reservation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    reservation = Reservations.get_reservation!(id, conn.assigns[:current_tenant])
    {:ok, _reservation} = Reservations.delete_reservation(reservation, conn.assigns[:current_tenant])

    conn
    |> put_flash(:info, "Reservation deleted successfully.")
    |> redirect(to: Routes.reservation_path(conn, :index))
  end
end
