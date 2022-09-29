defmodule Saas101.Repo.Migrations.CreateCourts do
  use Ecto.Migration

  def change do
    create table(:courts) do
      add :name, :string
      add :description, :binary
      add :venue_id, references(:venues, on_delete: :nothing)

      timestamps()
    end

    create index(:courts, [:venue_id])
  end
end
