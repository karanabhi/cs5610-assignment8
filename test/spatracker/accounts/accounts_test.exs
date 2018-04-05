defmodule Spatracker.AccountsTest do
  use Spatracker.DataCase

  alias Spatracker.Accounts

  describe "users" do
    alias Spatracker.Accounts.User

    @valid_attrs %{email: "some email", manager: "some manager", name: "some name"}
    @update_attrs %{email: "some updated email", manager: "some updated manager", name: "some updated name"}
    @invalid_attrs %{email: nil, manager: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.manager == "some manager"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.manager == "some updated manager"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "manages" do
    alias Spatracker.Accounts.Manage

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def manage_fixture(attrs \\ %{}) do
      {:ok, manage} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_manage()

      manage
    end

    test "list_manages/0 returns all manages" do
      manage = manage_fixture()
      assert Accounts.list_manages() == [manage]
    end

    test "get_manage!/1 returns the manage with given id" do
      manage = manage_fixture()
      assert Accounts.get_manage!(manage.id) == manage
    end

    test "create_manage/1 with valid data creates a manage" do
      assert {:ok, %Manage{} = manage} = Accounts.create_manage(@valid_attrs)
    end

    test "create_manage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_manage(@invalid_attrs)
    end

    test "update_manage/2 with valid data updates the manage" do
      manage = manage_fixture()
      assert {:ok, manage} = Accounts.update_manage(manage, @update_attrs)
      assert %Manage{} = manage
    end

    test "update_manage/2 with invalid data returns error changeset" do
      manage = manage_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_manage(manage, @invalid_attrs)
      assert manage == Accounts.get_manage!(manage.id)
    end

    test "delete_manage/1 deletes the manage" do
      manage = manage_fixture()
      assert {:ok, %Manage{}} = Accounts.delete_manage(manage)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_manage!(manage.id) end
    end

    test "change_manage/1 returns a manage changeset" do
      manage = manage_fixture()
      assert %Ecto.Changeset{} = Accounts.change_manage(manage)
    end
  end

  describe "time_blocks" do
    alias Spatracker.Accounts.Time_Blocks

    @valid_attrs %{end: "some end", start: "some start"}
    @update_attrs %{end: "some updated end", start: "some updated start"}
    @invalid_attrs %{end: nil, start: nil}

    def time__blocks_fixture(attrs \\ %{}) do
      {:ok, time__blocks} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_time__blocks()

      time__blocks
    end

    test "list_time_blocks/0 returns all time_blocks" do
      time__blocks = time__blocks_fixture()
      assert Accounts.list_time_blocks() == [time__blocks]
    end

    test "get_time__blocks!/1 returns the time__blocks with given id" do
      time__blocks = time__blocks_fixture()
      assert Accounts.get_time__blocks!(time__blocks.id) == time__blocks
    end

    test "create_time__blocks/1 with valid data creates a time__blocks" do
      assert {:ok, %Time_Blocks{} = time__blocks} = Accounts.create_time__blocks(@valid_attrs)
      assert time__blocks.end == "some end"
      assert time__blocks.start == "some start"
    end

    test "create_time__blocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_time__blocks(@invalid_attrs)
    end

    test "update_time__blocks/2 with valid data updates the time__blocks" do
      time__blocks = time__blocks_fixture()
      assert {:ok, time__blocks} = Accounts.update_time__blocks(time__blocks, @update_attrs)
      assert %Time_Blocks{} = time__blocks
      assert time__blocks.end == "some updated end"
      assert time__blocks.start == "some updated start"
    end

    test "update_time__blocks/2 with invalid data returns error changeset" do
      time__blocks = time__blocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_time__blocks(time__blocks, @invalid_attrs)
      assert time__blocks == Accounts.get_time__blocks!(time__blocks.id)
    end

    test "delete_time__blocks/1 deletes the time__blocks" do
      time__blocks = time__blocks_fixture()
      assert {:ok, %Time_Blocks{}} = Accounts.delete_time__blocks(time__blocks)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_time__blocks!(time__blocks.id) end
    end

    test "change_time__blocks/1 returns a time__blocks changeset" do
      time__blocks = time__blocks_fixture()
      assert %Ecto.Changeset{} = Accounts.change_time__blocks(time__blocks)
    end
  end
end
