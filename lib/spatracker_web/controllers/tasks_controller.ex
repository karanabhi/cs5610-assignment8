defmodule SpatrackerWeb.TasksController do
  use SpatrackerWeb, :controller

  alias Spatracker.Issue
  alias Spatracker.Issue.Tasks

  action_fallback SpatrackerWeb.FallbackController

  def index(conn, _params) do
    tasks = Issue.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  # def create(conn, %{"tasks" => tasks_params}) do
  #   with {:ok, %Tasks{} = tasks} <- Issue.create_tasks(tasks_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", tasks_path(conn, :show, tasks))
  #     |> render("show.json", tasks: tasks)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    tasks = Issue.get_tasks!(id)
    render(conn, "show.json", tasks: tasks)
  end

  def update(conn, %{"id" => id, "tasks" => tasks_params}) do
    tasks = Issue.get_tasks!(id)

    with {:ok, %Tasks{} = tasks} <- Issue.update_tasks(tasks, tasks_params) do
      render(conn, "show.json", tasks: tasks)
    end
  end

  def delete(conn, %{"id" => id}) do
    tasks = Issue.get_tasks!(id)
    with {:ok, %Tasks{}} <- Issue.delete_tasks(tasks) do
      send_resp(conn, :no_content, "")
    end
  end
end
