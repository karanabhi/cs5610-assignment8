defmodule Spatracker.Repo.Migrations.CreateTimeBlocks do
  use Ecto.Migration

  def change do
    create table(:time_blocks) do
      add :end, :string
      add :start, :string
      add :task_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:time_blocks, [:task_id])
  end
end
