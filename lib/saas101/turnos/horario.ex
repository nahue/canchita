defmodule Saas101.Turnos.Horario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "horarios" do
    field :end, :string
    field :start, :string

    timestamps()
  end

  @doc false
  def changeset(horario, attrs) do
    horario
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end])
  end
end
