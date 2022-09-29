defmodule Saas101.Repo.Migrations.CreateHorarios do
  use Ecto.Migration

  def change do
    create table(:horarios) do
      add :start, :string
      add :end, :string

      timestamps()
    end
  end
end
