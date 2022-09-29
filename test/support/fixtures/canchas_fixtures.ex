defmodule Saas101.CanchasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Saas101.Canchas` context.
  """

  @doc """
  Generate a turno.
  """
  def turno_fixture(attrs \\ %{}) do
    {:ok, turno} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Saas101.Canchas.create_turno()

    turno
  end
end
