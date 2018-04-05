defmodule Spatracker.Issue.Tasks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :assigned_to, :id, null: false
    field :description, :string
    field :status, :string, default: 'In Progress'
    field :title, :string, null: false
    field :user_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(tasks, attrs) do
    tasks
    |> cast(attrs, [:title, :description, :assigned_to, :status, :user_id])
    |> validate_required([:title, :description, :assigned_to, :status, :user_id])
  end
end
