defmodule Saas101Web.CourtControllerTest do
  use Saas101Web.ConnCase

  import Saas101.SettingsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all courts", %{conn: conn} do
      conn = get(conn, Routes.court_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Courts"
    end
  end

  describe "new court" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.court_path(conn, :new))
      assert html_response(conn, 200) =~ "New Court"
    end
  end

  describe "create court" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.court_path(conn, :create), court: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.court_path(conn, :show, id)

      conn = get(conn, Routes.court_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Court"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.court_path(conn, :create), court: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Court"
    end
  end

  describe "edit court" do
    setup [:create_court]

    test "renders form for editing chosen court", %{conn: conn, court: court} do
      conn = get(conn, Routes.court_path(conn, :edit, court))
      assert html_response(conn, 200) =~ "Edit Court"
    end
  end

  describe "update court" do
    setup [:create_court]

    test "redirects when data is valid", %{conn: conn, court: court} do
      conn = put(conn, Routes.court_path(conn, :update, court), court: @update_attrs)
      assert redirected_to(conn) == Routes.court_path(conn, :show, court)

      conn = get(conn, Routes.court_path(conn, :show, court))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, court: court} do
      conn = put(conn, Routes.court_path(conn, :update, court), court: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Court"
    end
  end

  describe "delete court" do
    setup [:create_court]

    test "deletes chosen court", %{conn: conn, court: court} do
      conn = delete(conn, Routes.court_path(conn, :delete, court))
      assert redirected_to(conn) == Routes.court_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.court_path(conn, :show, court))
      end
    end
  end

  defp create_court(_) do
    court = court_fixture()
    %{court: court}
  end
end
