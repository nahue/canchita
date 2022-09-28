defmodule Saas101.Clientes.Cliente do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clientes" do
    field :email, :string
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:name, :email, :phone])
    |> validate_required([:name, :email, :phone])
  end
end
