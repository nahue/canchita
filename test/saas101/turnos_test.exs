defmodule Saas101.TurnosTest do
  use Saas101.DataCase

  alias Saas101.Turnos

  describe "horarios" do
    alias Saas101.Turnos.Horario

    import Saas101.TurnosFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_horarios/0 returns all horarios" do
      horario = horario_fixture()
      assert Turnos.list_horarios() == [horario]
    end

    test "get_horario!/1 returns the horario with given id" do
      horario = horario_fixture()
      assert Turnos.get_horario!(horario.id) == horario
    end

    test "create_horario/1 with valid data creates a horario" do
      valid_attrs = %{end: "some end", start: "some start"}

      assert {:ok, %Horario{} = horario} = Turnos.create_horario(valid_attrs)
      assert horario.end == "some end"
      assert horario.start == "some start"
    end

    test "create_horario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Turnos.create_horario(@invalid_attrs)
    end

    test "update_horario/2 with valid data updates the horario" do
      horario = horario_fixture()
      update_attrs = %{end: "some updated end", start: "some updated start"}

      assert {:ok, %Horario{} = horario} = Turnos.update_horario(horario, update_attrs)
      assert horario.end == "some updated end"
      assert horario.start == "some updated start"
    end

    test "update_horario/2 with invalid data returns error changeset" do
      horario = horario_fixture()
      assert {:error, %Ecto.Changeset{}} = Turnos.update_horario(horario, @invalid_attrs)
      assert horario == Turnos.get_horario!(horario.id)
    end

    test "delete_horario/1 deletes the horario" do
      horario = horario_fixture()
      assert {:ok, %Horario{}} = Turnos.delete_horario(horario)
      assert_raise Ecto.NoResultsError, fn -> Turnos.get_horario!(horario.id) end
    end

    test "change_horario/1 returns a horario changeset" do
      horario = horario_fixture()
      assert %Ecto.Changeset{} = Turnos.change_horario(horario)
    end
  end

  describe "turnos" do
    alias Saas101.Turnos.Turno

    import Saas101.TurnosFixtures

    @invalid_attrs %{date: nil, name: nil}

    test "list_turnos/0 returns all turnos" do
      turno = turno_fixture()
      assert Turnos.list_turnos() == [turno]
    end

    test "get_turno!/1 returns the turno with given id" do
      turno = turno_fixture()
      assert Turnos.get_turno!(turno.id) == turno
    end

    test "create_turno/1 with valid data creates a turno" do
      valid_attrs = %{date: ~N[2022-09-28 00:05:00], name: "some name"}

      assert {:ok, %Turno{} = turno} = Turnos.create_turno(valid_attrs)
      assert turno.date == ~N[2022-09-28 00:05:00]
      assert turno.name == "some name"
    end

    test "create_turno/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Turnos.create_turno(@invalid_attrs)
    end

    test "update_turno/2 with valid data updates the turno" do
      turno = turno_fixture()
      update_attrs = %{date: ~N[2022-09-29 00:05:00], name: "some updated name"}

      assert {:ok, %Turno{} = turno} = Turnos.update_turno(turno, update_attrs)
      assert turno.date == ~N[2022-09-29 00:05:00]
      assert turno.name == "some updated name"
    end

    test "update_turno/2 with invalid data returns error changeset" do
      turno = turno_fixture()
      assert {:error, %Ecto.Changeset{}} = Turnos.update_turno(turno, @invalid_attrs)
      assert turno == Turnos.get_turno!(turno.id)
    end

    test "delete_turno/1 deletes the turno" do
      turno = turno_fixture()
      assert {:ok, %Turno{}} = Turnos.delete_turno(turno)
      assert_raise Ecto.NoResultsError, fn -> Turnos.get_turno!(turno.id) end
    end

    test "change_turno/1 returns a turno changeset" do
      turno = turno_fixture()
      assert %Ecto.Changeset{} = Turnos.change_turno(turno)
    end
  end

  describe "turnos" do
    alias Saas101.Turnos.Turno

    import Saas101.TurnosFixtures

    @invalid_attrs %{date: nil, name: nil}

    test "list_turnos/0 returns all turnos" do
      turno = turno_fixture()
      assert Turnos.list_turnos() == [turno]
    end

    test "get_turno!/1 returns the turno with given id" do
      turno = turno_fixture()
      assert Turnos.get_turno!(turno.id) == turno
    end

    test "create_turno/1 with valid data creates a turno" do
      valid_attrs = %{date: ~N[2022-09-28 00:06:00], name: "some name"}

      assert {:ok, %Turno{} = turno} = Turnos.create_turno(valid_attrs)
      assert turno.date == ~N[2022-09-28 00:06:00]
      assert turno.name == "some name"
    end

    test "create_turno/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Turnos.create_turno(@invalid_attrs)
    end

    test "update_turno/2 with valid data updates the turno" do
      turno = turno_fixture()
      update_attrs = %{date: ~N[2022-09-29 00:06:00], name: "some updated name"}

      assert {:ok, %Turno{} = turno} = Turnos.update_turno(turno, update_attrs)
      assert turno.date == ~N[2022-09-29 00:06:00]
      assert turno.name == "some updated name"
    end

    test "update_turno/2 with invalid data returns error changeset" do
      turno = turno_fixture()
      assert {:error, %Ecto.Changeset{}} = Turnos.update_turno(turno, @invalid_attrs)
      assert turno == Turnos.get_turno!(turno.id)
    end

    test "delete_turno/1 deletes the turno" do
      turno = turno_fixture()
      assert {:ok, %Turno{}} = Turnos.delete_turno(turno)
      assert_raise Ecto.NoResultsError, fn -> Turnos.get_turno!(turno.id) end
    end

    test "change_turno/1 returns a turno changeset" do
      turno = turno_fixture()
      assert %Ecto.Changeset{} = Turnos.change_turno(turno)
    end
  end
end
