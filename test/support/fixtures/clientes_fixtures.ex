defmodule Saas101.ClientesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Saas101.Clientes` context.
  """

  @doc """
  Generate a cliente.
  """
  def cliente_fixture(attrs \\ %{}) do
    {:ok, cliente} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        phone: "some phone"
      })
      |> Saas101.Clientes.create_cliente()

    cliente
  end
end
