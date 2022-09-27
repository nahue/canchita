defmodule Saas101.Locales.Local do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locales" do
    field :name, :string
    has_many :canchas, Saas101.Locales.Cancha
    timestamps()
  end

  @doc false
  def changeset(local, attrs) do
    local
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
