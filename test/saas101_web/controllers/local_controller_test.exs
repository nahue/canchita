defmodule Saas101Web.LocalControllerTest do
  use Saas101Web.ConnCase

  import Saas101.LocalesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all locales", %{conn: conn} do
      conn = get(conn, Routes.local_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Locales"
    end
  end

  describe "new local" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.local_path(conn, :new))
      assert html_response(conn, 200) =~ "New Local"
    end
  end

  describe "create local" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.local_path(conn, :create), local: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.local_path(conn, :show, id)

      conn = get(conn, Routes.local_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Local"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.local_path(conn, :create), local: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Local"
    end
  end

  describe "edit local" do
    setup [:create_local]

    test "renders form for editing chosen local", %{conn: conn, local: local} do
      conn = get(conn, Routes.local_path(conn, :edit, local))
      assert html_response(conn, 200) =~ "Edit Local"
    end
  end

  describe "update local" do
    setup [:create_local]

    test "redirects when data is valid", %{conn: conn, local: local} do
      conn = put(conn, Routes.local_path(conn, :update, local), local: @update_attrs)
      assert redirected_to(conn) == Routes.local_path(conn, :show, local)

      conn = get(conn, Routes.local_path(conn, :show, local))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, local: local} do
      conn = put(conn, Routes.local_path(conn, :update, local), local: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Local"
    end
  end

  describe "delete local" do
    setup [:create_local]

    test "deletes chosen local", %{conn: conn, local: local} do
      conn = delete(conn, Routes.local_path(conn, :delete, local))
      assert redirected_to(conn) == Routes.local_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.local_path(conn, :show, local))
      end
    end
  end

  defp create_local(_) do
    local = local_fixture()
    %{local: local}
  end
end
