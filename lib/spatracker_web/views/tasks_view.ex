defmodule SpatrackerWeb.TasksView do
  use SpatrackerWeb, :view
  alias SpatrackerWeb.TasksView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TasksView, "tasks.json")}
  end

  def render("show.json", %{tasks: tasks}) do
    %{data: render_one(tasks, TasksView, "tasks.json")}
  end

  def render("tasks.json", %{tasks: tasks}) do
    %{id: tasks.id,
      description: tasks.description,
      status: tasks.status,
      title: tasks.title}
  end
end
