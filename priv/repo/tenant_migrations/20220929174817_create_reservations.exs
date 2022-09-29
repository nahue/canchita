defmodule Saas101.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :name, :string
      add :date, :date
      add :court_id, references(:courts, on_delete: :nothing)

      timestamps()
    end

    create index(:reservations, [:court_id])
  end
end
