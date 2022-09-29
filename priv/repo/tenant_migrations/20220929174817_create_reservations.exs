defmodule Saas101.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :name, :string
      add :date, :date
      add :cancha_id, references(:canchas, on_delete: :nothing)

      timestamps()
    end

    create index(:reservations, [:cancha_id])
  end
end
