defmodule Saas101.LocalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Saas101.Locales` context.
  """

  @doc """
  Generate a cancha.
  """
  def cancha_fixture(attrs \\ %{}) do
    {:ok, cancha} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Saas101.Locales.create_cancha()

    cancha
  end

  @doc """
  Generate a local.
  """
  def local_fixture(attrs \\ %{}) do
    {:ok, local} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Saas101.Locales.create_local()

    local
  end
end
