defmodule Saas101.CanchasTest do
  use Saas101.DataCase

  alias Saas101.Canchas

  describe "turnos" do
    alias Saas101.Canchas.Turno

    import Saas101.CanchasFixtures

    @invalid_attrs %{name: nil}

    test "list_turnos/0 returns all turnos" do
      turno = turno_fixture()
      assert Canchas.list_turnos() == [turno]
    end

    test "get_turno!/1 returns the turno with given id" do
      turno = turno_fixture()
      assert Canchas.get_turno!(turno.id) == turno
    end

    test "create_turno/1 with valid data creates a turno" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Turno{} = turno} = Canchas.create_turno(valid_attrs)
      assert turno.name == "some name"
    end

    test "create_turno/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Canchas.create_turno(@invalid_attrs)
    end

    test "update_turno/2 with valid data updates the turno" do
      turno = turno_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Turno{} = turno} = Canchas.update_turno(turno, update_attrs)
      assert turno.name == "some updated name"
    end

    test "update_turno/2 with invalid data returns error changeset" do
      turno = turno_fixture()
      assert {:error, %Ecto.Changeset{}} = Canchas.update_turno(turno, @invalid_attrs)
      assert turno == Canchas.get_turno!(turno.id)
    end

    test "delete_turno/1 deletes the turno" do
      turno = turno_fixture()
      assert {:ok, %Turno{}} = Canchas.delete_turno(turno)
      assert_raise Ecto.NoResultsError, fn -> Canchas.get_turno!(turno.id) end
    end

    test "change_turno/1 returns a turno changeset" do
      turno = turno_fixture()
      assert %Ecto.Changeset{} = Canchas.change_turno(turno)
    end
  end
end
