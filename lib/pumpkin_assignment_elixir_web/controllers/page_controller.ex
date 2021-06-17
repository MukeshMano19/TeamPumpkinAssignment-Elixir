defmodule PumpkinAssignmentElixirWeb.PageController do
  use PumpkinAssignmentElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
