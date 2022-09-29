defmodule Saas101.Repo.Migrations.CreateTurnos do
  use Ecto.Migration

  def change do
    create table(:turnos) do
      add :name, :string
      add :date, :date
      add :cancha_id, references(:canchas, on_delete: :nothing)

      timestamps()
    end

    create index(:turnos, [:cancha_id])
  end
end
