defmodule Saas101.Repo.Migrations.CreateCanchas do
  use Ecto.Migration

  def change do
    create table(:canchas) do
      add :name, :string
      add :description, :binary
      add :local_id, references(:locales)

      timestamps()
    end

    create index(:canchas, [:local_id])
  end
end
