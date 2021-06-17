defmodule PumpkinAssignmentElixirWeb.UserController do
  use PumpkinAssignmentElixirWeb, :controller
  alias PumpkinAssignmentElixir.Users
  alias PumpkinAssignmentElixir.Users.User

  action_fallback PumpkinAssignmentElixirWeb.FallbackController

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, params) do
    case Users.create_user(params) do
      {:ok, %User{} = user} ->
        conn
        |> put_status(:created)
        |> render("message.json", message: "saved")

      {:error, changeset} ->
        {:error, changeset}
    end
  end
end
