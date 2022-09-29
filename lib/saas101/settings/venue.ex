defmodule Saas101.Settings.Venue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "venues" do
    field :name, :string
    has_many :courts, Saas101.Settings.Court
    timestamps()
  end

  @doc false
  def changeset(venue, attrs) do
    venue
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
