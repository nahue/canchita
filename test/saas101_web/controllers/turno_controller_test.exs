defmodule Saas101Web.TurnoControllerTest do
  use Saas101Web.ConnCase

  import Saas101.TurnosFixtures

  @create_attrs %{date: ~N[2022-09-28 00:06:00], name: "some name"}
  @update_attrs %{date: ~N[2022-09-29 00:06:00], name: "some updated name"}
  @invalid_attrs %{date: nil, name: nil}

  describe "index" do
    test "lists all turnos", %{conn: conn} do
      conn = get(conn, Routes.turno_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Turnos"
    end
  end

  describe "new turno" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.turno_path(conn, :new))
      assert html_response(conn, 200) =~ "New Turno"
    end
  end

  describe "create turno" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.turno_path(conn, :create), turno: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.turno_path(conn, :show, id)

      conn = get(conn, Routes.turno_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Turno"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.turno_path(conn, :create), turno: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Turno"
    end
  end

  describe "edit turno" do
    setup [:create_turno]

    test "renders form for editing chosen turno", %{conn: conn, turno: turno} do
      conn = get(conn, Routes.turno_path(conn, :edit, turno))
      assert html_response(conn, 200) =~ "Edit Turno"
    end
  end

  describe "update turno" do
    setup [:create_turno]

    test "redirects when data is valid", %{conn: conn, turno: turno} do
      conn = put(conn, Routes.turno_path(conn, :update, turno), turno: @update_attrs)
      assert redirected_to(conn) == Routes.turno_path(conn, :show, turno)

      conn = get(conn, Routes.turno_path(conn, :show, turno))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, turno: turno} do
      conn = put(conn, Routes.turno_path(conn, :update, turno), turno: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Turno"
    end
  end

  describe "delete turno" do
    setup [:create_turno]

    test "deletes chosen turno", %{conn: conn, turno: turno} do
      conn = delete(conn, Routes.turno_path(conn, :delete, turno))
      assert redirected_to(conn) == Routes.turno_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.turno_path(conn, :show, turno))
      end
    end
  end

  defp create_turno(_) do
    turno = turno_fixture()
    %{turno: turno}
  end
end
