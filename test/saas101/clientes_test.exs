defmodule Saas101.ClientesTest do
  use Saas101.DataCase

  alias Saas101.Clientes

  describe "clientes" do
    alias Saas101.Clientes.Cliente

    import Saas101.ClientesFixtures

    @invalid_attrs %{email: nil, name: nil, phone: nil}

    test "list_clientes/0 returns all clientes" do
      cliente = cliente_fixture()
      assert Clientes.list_clientes() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Clientes.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      valid_attrs = %{email: "some email", name: "some name", phone: "some phone"}

      assert {:ok, %Cliente{} = cliente} = Clientes.create_cliente(valid_attrs)
      assert cliente.email == "some email"
      assert cliente.name == "some name"
      assert cliente.phone == "some phone"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clientes.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name", phone: "some updated phone"}

      assert {:ok, %Cliente{} = cliente} = Clientes.update_cliente(cliente, update_attrs)
      assert cliente.email == "some updated email"
      assert cliente.name == "some updated name"
      assert cliente.phone == "some updated phone"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Clientes.update_cliente(cliente, @invalid_attrs)
      assert cliente == Clientes.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Clientes.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Clientes.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Clientes.change_cliente(cliente)
    end
  end
end
