defmodule Saas101.Repo.Migrations.CreateLocales do
  use Ecto.Migration

  def change do
    create table(:locales) do
      add :name, :string
      # has_many :canchas, Saas101.Locales.Cancha

      timestamps()
    end
  end
end
