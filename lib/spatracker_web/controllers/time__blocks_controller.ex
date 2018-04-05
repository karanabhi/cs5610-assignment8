defmodule SpatrackerWeb.Time_BlocksController do
  use SpatrackerWeb, :controller

  alias Spatracker.Accounts
  alias Spatracker.Accounts.Time_Blocks

  action_fallback SpatrackerWeb.FallbackController

  def index(conn, _params) do
    time_blocks = Accounts.list_time_blocks()
    render(conn, "index.json", time_blocks: time_blocks)
  end

  # def create(conn, %{"time__blocks" => time__blocks_params}) do
  #   with {:ok, %Time_Blocks{} = time__blocks} <- Accounts.create_time__blocks(time__blocks_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", time__blocks_path(conn, :show, time__blocks))
  #     |> render("show.json", time__blocks: time__blocks)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    time__blocks = Accounts.get_time__blocks!(id)
    render(conn, "show.json", time__blocks: time__blocks)
  end

  def update(conn, %{"id" => id, "time__blocks" => time__blocks_params}) do
    time__blocks = Accounts.get_time__blocks!(id)

    with {:ok, %Time_Blocks{} = time__blocks} <- Accounts.update_time__blocks(time__blocks, time__blocks_params) do
      render(conn, "show.json", time__blocks: time__blocks)
    end
  end

  def delete(conn, %{"id" => id}) do
    time__blocks = Accounts.get_time__blocks!(id)
    with {:ok, %Time_Blocks{}} <- Accounts.delete_time__blocks(time__blocks) do
      send_resp(conn, :no_content, "")
    end
  end
end
