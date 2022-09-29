defmodule Saas101.TurnosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Saas101.Turnos` context.
  """

  @doc """
  Generate a horario.
  """
  def horario_fixture(attrs \\ %{}) do
    {:ok, horario} =
      attrs
      |> Enum.into(%{
        end: "some end",
        start: "some start"
      })
      |> Saas101.Turnos.create_horario()

    horario
  end

  @doc """
  Generate a turno.
  """
  def turno_fixture(attrs \\ %{}) do
    {:ok, turno} =
      attrs
      |> Enum.into(%{
        date: ~N[2022-09-28 00:05:00],
        name: "some name"
      })
      |> Saas101.Turnos.create_turno()

    turno
  end

  @doc """
  Generate a turno.
  """
  def turno_fixture(attrs \\ %{}) do
    {:ok, turno} =
      attrs
      |> Enum.into(%{
        date: ~N[2022-09-28 00:06:00],
        name: "some name"
      })
      |> Saas101.Turnos.create_turno()

    turno
  end
end
