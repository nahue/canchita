defmodule Saas101.ReservationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Saas101.Reservations` context.
  """

  @doc """
  Generate a reservation.
  """
  def reservation_fixture(attrs \\ %{}) do
    {:ok, reservation} =
      attrs
      |> Enum.into(%{
        date: ~D[2022-09-28],
        name: "some name"
      })
      |> Saas101.Reservations.create_reservation()

    reservation
  end
end
