defmodule Saas101Web.HorarioControllerTest do
  use Saas101Web.ConnCase

  import Saas101.TurnosFixtures

  @create_attrs %{end: "some end", start: "some start"}
  @update_attrs %{end: "some updated end", start: "some updated start"}
  @invalid_attrs %{end: nil, start: nil}

  describe "index" do
    test "lists all horarios", %{conn: conn} do
      conn = get(conn, Routes.horario_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Horarios"
    end
  end

  describe "new horario" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.horario_path(conn, :new))
      assert html_response(conn, 200) =~ "New Horario"
    end
  end

  describe "create horario" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.horario_path(conn, :create), horario: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.horario_path(conn, :show, id)

      conn = get(conn, Routes.horario_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Horario"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.horario_path(conn, :create), horario: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Horario"
    end
  end

  describe "edit horario" do
    setup [:create_horario]

    test "renders form for editing chosen horario", %{conn: conn, horario: horario} do
      conn = get(conn, Routes.horario_path(conn, :edit, horario))
      assert html_response(conn, 200) =~ "Edit Horario"
    end
  end

  describe "update horario" do
    setup [:create_horario]

    test "redirects when data is valid", %{conn: conn, horario: horario} do
      conn = put(conn, Routes.horario_path(conn, :update, horario), horario: @update_attrs)
      assert redirected_to(conn) == Routes.horario_path(conn, :show, horario)

      conn = get(conn, Routes.horario_path(conn, :show, horario))
      assert html_response(conn, 200) =~ "some updated end"
    end

    test "renders errors when data is invalid", %{conn: conn, horario: horario} do
      conn = put(conn, Routes.horario_path(conn, :update, horario), horario: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Horario"
    end
  end

  describe "delete horario" do
    setup [:create_horario]

    test "deletes chosen horario", %{conn: conn, horario: horario} do
      conn = delete(conn, Routes.horario_path(conn, :delete, horario))
      assert redirected_to(conn) == Routes.horario_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.horario_path(conn, :show, horario))
      end
    end
  end

  defp create_horario(_) do
    horario = horario_fixture()
    %{horario: horario}
  end
end
