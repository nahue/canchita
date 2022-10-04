defmodule Saas101.Reservations.Reservation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reservations" do
    field :date, :date
    field :name, :string
    belongs_to :court, Saas101.Settings.Court, foreign_key: :court_id

    timestamps()
  end

  @doc false
  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:name, :date, :court_id])
    |> validate_required([:name, :date, :court_id])
  end
end
