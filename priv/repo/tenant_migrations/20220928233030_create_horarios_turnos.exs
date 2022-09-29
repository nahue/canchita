defmodule Saas101.Repo.Migrations.CreateHorariosTurnos do
  use Ecto.Migration

  def change do
    create table(:horarios_turnos, primary_key: false) do
      add(:horario_id, references(:horarios, on_delete: :nothing), primary_key: true)
      add(:turno_id, references(:turnos, on_delete: :nothing), primary_key: true)
      timestamps()
    end

    create(index(:horarios_turnos, [:horario_id]))
    create(index(:horarios_turnos, [:turno_id]))
  end
end
