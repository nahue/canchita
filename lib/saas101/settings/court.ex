defmodule Saas101.Settings.Court do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courts" do
    field :name, :string
    belongs_to :venue, Saas101.Settings.Venue, foreign_key: :venue_id
    timestamps()
  end

  @doc false
  def changeset(court, attrs) do
    court
    |> cast(attrs, [:name, :venue_id])
    |> validate_required([:name, :venue_id])
  end
end
