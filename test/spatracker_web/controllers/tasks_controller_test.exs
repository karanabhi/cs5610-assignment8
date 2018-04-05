defmodule SpatrackerWeb.TasksControllerTest do
  use SpatrackerWeb.ConnCase

  alias Spatracker.Issue
  alias Spatracker.Issue.Tasks

  @create_attrs %{description: "some description", status: "some status", title: "some title"}
  @update_attrs %{description: "some updated description", status: "some updated status", title: "some updated title"}
  @invalid_attrs %{description: nil, status: nil, title: nil}

  def fixture(:tasks) do
    {:ok, tasks} = Issue.create_tasks(@create_attrs)
    tasks
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tasks", %{conn: conn} do
      conn = get conn, tasks_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tasks" do
    test "renders tasks when data is valid", %{conn: conn} do
      conn = post conn, tasks_path(conn, :create), tasks: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, tasks_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "status" => "some status",
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tasks_path(conn, :create), tasks: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tasks" do
    setup [:create_tasks]

    test "renders tasks when data is valid", %{conn: conn, tasks: %Tasks{id: id} = tasks} do
      conn = put conn, tasks_path(conn, :update, tasks), tasks: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, tasks_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "status" => "some updated status",
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, tasks: tasks} do
      conn = put conn, tasks_path(conn, :update, tasks), tasks: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tasks" do
    setup [:create_tasks]

    test "deletes chosen tasks", %{conn: conn, tasks: tasks} do
      conn = delete conn, tasks_path(conn, :delete, tasks)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, tasks_path(conn, :show, tasks)
      end
    end
  end

  defp create_tasks(_) do
    tasks = fixture(:tasks)
    {:ok, tasks: tasks}
  end
end
