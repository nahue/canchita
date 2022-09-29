defmodule Saas101Web.VenueController do
  use Saas101Web, :controller

  alias Saas101.Settings
  alias Saas101.Settings.Venue

  def index(conn, _params) do
    venues = Settings.list_venues(conn.assigns[:current_tenant])
    render(conn, "index.html", venues: venues)
  end

  def new(conn, _params) do
    changeset = Settings.change_venue(%Venue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"venue" => venue_params}) do
    case Settings.create_venue(venue_params, conn.assigns[:current_tenant]) do
      {:ok, venue} ->
        conn
        |> put_flash(:info, "Venue created successfully.")
        |> redirect(to: Routes.venue_path(conn, :show, venue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    venue = Settings.get_venue!(id, conn.assigns[:current_tenant])
    render(conn, "show.html", venue: venue)
  end

  def edit(conn, %{"id" => id}) do
    venue = Settings.get_venue!(id, conn.assigns[:current_tenant])
    changeset = Settings.change_venue(venue)
    render(conn, "edit.html", venue: venue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "venue" => venue_params}) do
    venue = Settings.get_venue!(id, conn.assigns[:current_tenant])

    case Settings.update_venue(venue, venue_params, conn.assigns[:current_tenant]) do
      {:ok, venue} ->
        conn
        |> put_flash(:info, "Venue updated successfully.")
        |> redirect(to: Routes.venue_path(conn, :show, venue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", venue: venue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    venue = Settings.get_venue!(id, conn.assigns[:current_tenant])
    {:ok, _venue} = Settings.delete_venue(venue, conn.assigns[:current_tenant])

    conn
    |> put_flash(:info, "Venue deleted successfully.")
    |> redirect(to: Routes.venue_path(conn, :index))
  end
end
