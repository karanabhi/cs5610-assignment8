defmodule SpatrackerWeb.Time_BlocksView do
  use SpatrackerWeb, :view
  alias SpatrackerWeb.Time_BlocksView

  def render("index.json", %{time_blocks: time_blocks}) do
    %{data: render_many(time_blocks, Time_BlocksView, "time__blocks.json")}
  end

  def render("show.json", %{time__blocks: time__blocks}) do
    %{data: render_one(time__blocks, Time_BlocksView, "time__blocks.json")}
  end

  def render("time__blocks.json", %{time__blocks: time__blocks}) do
    %{id: time__blocks.id,
      end: time__blocks.end,
      start: time__blocks.start}
  end
end
