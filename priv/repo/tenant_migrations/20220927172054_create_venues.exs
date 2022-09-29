defmodule Saas101.Repo.Migrations.CreateVenues do
  use Ecto.Migration

  def change do
    create table(:venues) do
      add :name, :string

      timestamps()
    end
  end
end
