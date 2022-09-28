defmodule Saas101.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes) do
      add :name, :string
      add :email, :string
      add :phone, :string

      timestamps()
    end
  end
end
