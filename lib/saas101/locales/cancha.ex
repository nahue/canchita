defmodule Saas101.Locales.Cancha do
  use Ecto.Schema
  import Ecto.Changeset

  schema "canchas" do
    field :name, :string
    field :description, :string
    belongs_to :local, Saas101.Locales.Local, foreign_key: :local_id
    timestamps()
  end

  @doc false
  def changeset(cancha, attrs) do
    cancha
    |> cast(attrs, [:name, :description, :local_id])
    |> validate_required([:name, :description, :local_id])
  end
end
