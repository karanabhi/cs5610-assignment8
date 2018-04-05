defmodule Spatracker.Accounts.Time_Blocks do
  use Ecto.Schema
  import Ecto.Changeset


  schema "time_blocks" do
    field :end, :string, null: false
    field :start, :string, null: false
    field :task_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(time__blocks, attrs) do
    time__blocks
    |> cast(attrs, [:task_id,:start,:end])
    |> validate_required([:task_id,:start,:end])
  end
end
