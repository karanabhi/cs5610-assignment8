defmodule Spatracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :description, :string
      add :status, :string
      add :title, :string
      add :assigned_to, references(:users, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:assigned_to])
    create index(:tasks, [:user_id])
  end
end
