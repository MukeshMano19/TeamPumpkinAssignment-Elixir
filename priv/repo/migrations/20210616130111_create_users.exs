defmodule PumpkinAssignmentElixir.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :type, :string
      add(:password, :string, virtual: true)

      timestamps()
    end

  end
end
