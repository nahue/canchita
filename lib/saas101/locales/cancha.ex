defmodule Saas101.Locales.Cancha do
  use Ecto.Schema
  import Ecto.Changeset

  schema "canchas" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(cancha, attrs) do
    cancha
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
