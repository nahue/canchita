defmodule Saas101.Reservations.Reservation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reservations" do
    field :date, :date
    field :name, :string
    field :cancha_id, :id

    timestamps()
  end

  @doc false
  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
