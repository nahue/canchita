defmodule Saas101Web.CanchaControllerTest do
  use Saas101Web.ConnCase

  import Saas101.LocalesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all canchas", %{conn: conn} do
      conn = get(conn, Routes.cancha_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Canchas"
    end
  end

  describe "new cancha" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cancha_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cancha"
    end
  end

  describe "create cancha" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cancha_path(conn, :create), cancha: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cancha_path(conn, :show, id)

      conn = get(conn, Routes.cancha_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cancha"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cancha_path(conn, :create), cancha: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cancha"
    end
  end

  describe "edit cancha" do
    setup [:create_cancha]

    test "renders form for editing chosen cancha", %{conn: conn, cancha: cancha} do
      conn = get(conn, Routes.cancha_path(conn, :edit, cancha))
      assert html_response(conn, 200) =~ "Edit Cancha"
    end
  end

  describe "update cancha" do
    setup [:create_cancha]

    test "redirects when data is valid", %{conn: conn, cancha: cancha} do
      conn = put(conn, Routes.cancha_path(conn, :update, cancha), cancha: @update_attrs)
      assert redirected_to(conn) == Routes.cancha_path(conn, :show, cancha)

      conn = get(conn, Routes.cancha_path(conn, :show, cancha))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, cancha: cancha} do
      conn = put(conn, Routes.cancha_path(conn, :update, cancha), cancha: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cancha"
    end
  end

  describe "delete cancha" do
    setup [:create_cancha]

    test "deletes chosen cancha", %{conn: conn, cancha: cancha} do
      conn = delete(conn, Routes.cancha_path(conn, :delete, cancha))
      assert redirected_to(conn) == Routes.cancha_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.cancha_path(conn, :show, cancha))
      end
    end
  end

  defp create_cancha(_) do
    cancha = cancha_fixture()
    %{cancha: cancha}
  end
end
