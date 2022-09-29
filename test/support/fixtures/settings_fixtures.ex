defmodule Saas101.SettingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Saas101.Settings` context.
  """

  @doc """
  Generate a venue.
  """
  def venue_fixture(attrs \\ %{}) do
    {:ok, venue} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Saas101.Settings.create_venue()

    venue
  end

  @doc """
  Generate a court.
  """
  def court_fixture(attrs \\ %{}) do
    {:ok, court} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Saas101.Settings.create_court()

    court
  end
end
