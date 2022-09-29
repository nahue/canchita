defmodule Saas101Web.CourtController do
  use Saas101Web, :controller

  alias Saas101.Settings
  alias Saas101.Settings.{Court, Venue}

  def index(conn, _params) do
    courts = Settings.list_courts(conn.assigns[:current_tenant])
    render(conn, "index.html", courts: courts)
  end

  def new(conn, _params) do
    changeset = Settings.change_court(%Court{})
    venues = Saas101.Repo.all(Venue, prefix: conn.assigns[:current_tenant]) |> Enum.map(&{&1.name, &1.id})
    render(conn, "new.html", changeset: changeset, venues: venues)
  end

  def create(conn, %{"court" => court_params}) do
    case Settings.create_court(court_params, conn.assigns[:current_tenant]) do
      {:ok, court} ->
        conn
        |> put_flash(:info, "Court created successfully.")
        |> redirect(to: Routes.court_path(conn, :show, court))

      {:error, %Ecto.Changeset{} = changeset} ->
        venues = Saas101.Repo.all(Venue, prefix: conn.assigns[:current_tenant]) |> Enum.map(&{&1.name, &1.id})
        render(conn, "new.html", changeset: changeset, venues: venues)
    end
  end

  def show(conn, %{"id" => id}) do
    court = Settings.get_court!(id, conn.assigns[:current_tenant])
    venues = Saas101.Repo.all(Venue, prefix: conn.assigns[:current_tenant]) |> Enum.map(&{&1.name, &1.id})
    render(conn, "show.html", court: court, venues: venues)
  end

  def edit(conn, %{"id" => id}) do
    court = Settings.get_court!(id, conn.assigns[:current_tenant])
    venues = Saas101.Repo.all(Venue, prefix: conn.assigns[:current_tenant]) |> Enum.map(&{&1.name, &1.id})
    changeset = Settings.change_court(court)
    render(conn, "edit.html", court: court, changeset: changeset, venues: venues)
  end

  def update(conn, %{"id" => id, "court" => court_params}) do
    court = Settings.get_court!(id, conn.assigns[:current_tenant])

    case Settings.update_court(court, court_params, conn.assigns[:current_tenant]) do
      {:ok, court} ->
        conn
        |> put_flash(:info, "Court updated successfully.")
        |> redirect(to: Routes.court_path(conn, :show, court))

      {:error, %Ecto.Changeset{} = changeset} ->
        venues = Saas101.Repo.all(Venue, prefix: conn.assigns[:current_tenant]) |> Enum.map(&{&1.name, &1.id})
        render(conn, "edit.html", court: court, changeset: changeset, venues: venues)
    end
  end

  def delete(conn, %{"id" => id}) do
    court = Settings.get_court!(id, conn.assigns[:current_tenant])
    {:ok, _court} = Settings.delete_court(court, conn.assigns[:current_tenant])

    conn
    |> put_flash(:info, "Court deleted successfully.")
    |> redirect(to: Routes.court_path(conn, :index))
  end
end
