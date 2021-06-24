defmodule PumpkinAssignmentElixir.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :name, :string
      add :total_downloads, :integer, default: 0
      add :category, :integer
      add :batch_unique_id, :string
      add(:image_binary, :binary)
      add(:contributor_id, references(:users))

      timestamps()
    end

    create(index(:images, [:contributor_id]))
  end
end
