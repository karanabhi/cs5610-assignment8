defmodule Spatracker.IssueTest do
  use Spatracker.DataCase

  alias Spatracker.Issue

  describe "tasks" do
    alias Spatracker.Issue.Tasks

    @valid_attrs %{description: "some description", status: "some status", title: "some title"}
    @update_attrs %{description: "some updated description", status: "some updated status", title: "some updated title"}
    @invalid_attrs %{description: nil, status: nil, title: nil}

    def tasks_fixture(attrs \\ %{}) do
      {:ok, tasks} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Issue.create_tasks()

      tasks
    end

    test "list_tasks/0 returns all tasks" do
      tasks = tasks_fixture()
      assert Issue.list_tasks() == [tasks]
    end

    test "get_tasks!/1 returns the tasks with given id" do
      tasks = tasks_fixture()
      assert Issue.get_tasks!(tasks.id) == tasks
    end

    test "create_tasks/1 with valid data creates a tasks" do
      assert {:ok, %Tasks{} = tasks} = Issue.create_tasks(@valid_attrs)
      assert tasks.description == "some description"
      assert tasks.status == "some status"
      assert tasks.title == "some title"
    end

    test "create_tasks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Issue.create_tasks(@invalid_attrs)
    end

    test "update_tasks/2 with valid data updates the tasks" do
      tasks = tasks_fixture()
      assert {:ok, tasks} = Issue.update_tasks(tasks, @update_attrs)
      assert %Tasks{} = tasks
      assert tasks.description == "some updated description"
      assert tasks.status == "some updated status"
      assert tasks.title == "some updated title"
    end

    test "update_tasks/2 with invalid data returns error changeset" do
      tasks = tasks_fixture()
      assert {:error, %Ecto.Changeset{}} = Issue.update_tasks(tasks, @invalid_attrs)
      assert tasks == Issue.get_tasks!(tasks.id)
    end

    test "delete_tasks/1 deletes the tasks" do
      tasks = tasks_fixture()
      assert {:ok, %Tasks{}} = Issue.delete_tasks(tasks)
      assert_raise Ecto.NoResultsError, fn -> Issue.get_tasks!(tasks.id) end
    end

    test "change_tasks/1 returns a tasks changeset" do
      tasks = tasks_fixture()
      assert %Ecto.Changeset{} = Issue.change_tasks(tasks)
    end
  end
end
