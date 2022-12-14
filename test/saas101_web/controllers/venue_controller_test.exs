defmodule Saas101Web.VenueControllerTest do
  use Saas101Web.ConnCase

  import Saas101.SettingsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all venues", %{conn: conn} do
      conn = get(conn, Routes.venue_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Venues"
    end
  end

  describe "new venue" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.venue_path(conn, :new))
      assert html_response(conn, 200) =~ "New Venue"
    end
  end

  describe "create venue" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.venue_path(conn, :create), venue: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.venue_path(conn, :show, id)

      conn = get(conn, Routes.venue_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Venue"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.venue_path(conn, :create), venue: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Venue"
    end
  end

  describe "edit venue" do
    setup [:create_venue]

    test "renders form for editing chosen venue", %{conn: conn, venue: venue} do
      conn = get(conn, Routes.venue_path(conn, :edit, venue))
      assert html_response(conn, 200) =~ "Edit Venue"
    end
  end

  describe "update venue" do
    setup [:create_venue]

    test "redirects when data is valid", %{conn: conn, venue: venue} do
      conn = put(conn, Routes.venue_path(conn, :update, venue), venue: @update_attrs)
      assert redirected_to(conn) == Routes.venue_path(conn, :show, venue)

      conn = get(conn, Routes.venue_path(conn, :show, venue))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, venue: venue} do
      conn = put(conn, Routes.venue_path(conn, :update, venue), venue: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Venue"
    end
  end

  describe "delete venue" do
    setup [:create_venue]

    test "deletes chosen venue", %{conn: conn, venue: venue} do
      conn = delete(conn, Routes.venue_path(conn, :delete, venue))
      assert redirected_to(conn) == Routes.venue_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.venue_path(conn, :show, venue))
      end
    end
  end

  defp create_venue(_) do
    venue = venue_fixture()
    %{venue: venue}
  end
end
