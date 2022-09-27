defmodule Saas101.Repo.Migrations.CreateCanchas do
  use Ecto.Migration

  def change do
    create table(:canchas) do
      add :name, :string

      timestamps()
    end
  end
end
