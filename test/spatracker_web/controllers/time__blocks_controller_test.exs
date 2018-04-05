defmodule SpatrackerWeb.Time_BlocksControllerTest do
  use SpatrackerWeb.ConnCase

  alias Spatracker.Accounts
  alias Spatracker.Accounts.Time_Blocks

  @create_attrs %{end: "some end", start: "some start"}
  @update_attrs %{end: "some updated end", start: "some updated start"}
  @invalid_attrs %{end: nil, start: nil}

  def fixture(:time__blocks) do
    {:ok, time__blocks} = Accounts.create_time__blocks(@create_attrs)
    time__blocks
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all time_blocks", %{conn: conn} do
      conn = get conn, time__blocks_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create time__blocks" do
    test "renders time__blocks when data is valid", %{conn: conn} do
      conn = post conn, time__blocks_path(conn, :create), time__blocks: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, time__blocks_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "end" => "some end",
        "start" => "some start"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, time__blocks_path(conn, :create), time__blocks: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update time__blocks" do
    setup [:create_time__blocks]

    test "renders time__blocks when data is valid", %{conn: conn, time__blocks: %Time_Blocks{id: id} = time__blocks} do
      conn = put conn, time__blocks_path(conn, :update, time__blocks), time__blocks: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, time__blocks_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "end" => "some updated end",
        "start" => "some updated start"}
    end

    test "renders errors when data is invalid", %{conn: conn, time__blocks: time__blocks} do
      conn = put conn, time__blocks_path(conn, :update, time__blocks), time__blocks: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete time__blocks" do
    setup [:create_time__blocks]

    test "deletes chosen time__blocks", %{conn: conn, time__blocks: time__blocks} do
      conn = delete conn, time__blocks_path(conn, :delete, time__blocks)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, time__blocks_path(conn, :show, time__blocks)
      end
    end
  end

  defp create_time__blocks(_) do
    time__blocks = fixture(:time__blocks)
    {:ok, time__blocks: time__blocks}
  end
end
