defmodule Saas101.LocalesTest do
  use Saas101.DataCase

  alias Saas101.Locales

  describe "canchas" do
    alias Saas101.Locales.Cancha

    import Saas101.LocalesFixtures

    @invalid_attrs %{name: nil}

    test "list_canchas/0 returns all canchas" do
      cancha = cancha_fixture()
      assert Locales.list_canchas() == [cancha]
    end

    test "get_cancha!/1 returns the cancha with given id" do
      cancha = cancha_fixture()
      assert Locales.get_cancha!(cancha.id) == cancha
    end

    test "create_cancha/1 with valid data creates a cancha" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Cancha{} = cancha} = Locales.create_cancha(valid_attrs)
      assert cancha.name == "some name"
    end

    test "create_cancha/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locales.create_cancha(@invalid_attrs)
    end

    test "update_cancha/2 with valid data updates the cancha" do
      cancha = cancha_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Cancha{} = cancha} = Locales.update_cancha(cancha, update_attrs)
      assert cancha.name == "some updated name"
    end

    test "update_cancha/2 with invalid data returns error changeset" do
      cancha = cancha_fixture()
      assert {:error, %Ecto.Changeset{}} = Locales.update_cancha(cancha, @invalid_attrs)
      assert cancha == Locales.get_cancha!(cancha.id)
    end

    test "delete_cancha/1 deletes the cancha" do
      cancha = cancha_fixture()
      assert {:ok, %Cancha{}} = Locales.delete_cancha(cancha)
      assert_raise Ecto.NoResultsError, fn -> Locales.get_cancha!(cancha.id) end
    end

    test "change_cancha/1 returns a cancha changeset" do
      cancha = cancha_fixture()
      assert %Ecto.Changeset{} = Locales.change_cancha(cancha)
    end
  end

  describe "locales" do
    alias Saas101.Locales.Local

    import Saas101.LocalesFixtures

    @invalid_attrs %{name: nil}

    test "list_locales/0 returns all locales" do
      local = local_fixture()
      assert Locales.list_locales() == [local]
    end

    test "get_local!/1 returns the local with given id" do
      local = local_fixture()
      assert Locales.get_local!(local.id) == local
    end

    test "create_local/1 with valid data creates a local" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Local{} = local} = Locales.create_local(valid_attrs)
      assert local.name == "some name"
    end

    test "create_local/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locales.create_local(@invalid_attrs)
    end

    test "update_local/2 with valid data updates the local" do
      local = local_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Local{} = local} = Locales.update_local(local, update_attrs)
      assert local.name == "some updated name"
    end

    test "update_local/2 with invalid data returns error changeset" do
      local = local_fixture()
      assert {:error, %Ecto.Changeset{}} = Locales.update_local(local, @invalid_attrs)
      assert local == Locales.get_local!(local.id)
    end

    test "delete_local/1 deletes the local" do
      local = local_fixture()
      assert {:ok, %Local{}} = Locales.delete_local(local)
      assert_raise Ecto.NoResultsError, fn -> Locales.get_local!(local.id) end
    end

    test "change_local/1 returns a local changeset" do
      local = local_fixture()
      assert %Ecto.Changeset{} = Locales.change_local(local)
    end
  end
end
