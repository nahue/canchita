defmodule Saas101.Turnos.Turno do
  use Ecto.Schema
  import Ecto.Changeset

  schema "turnos" do
    field :date, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(turno, attrs) do
    turno
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
