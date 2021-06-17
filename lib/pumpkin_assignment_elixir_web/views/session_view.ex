defmodule PumpkinAssignmentElixirWeb.SessionView do
  use PumpkinAssignmentElixirWeb, :view
  alias PumpkinAssignmentElixirWeb.SessionView

  def render("success.json", %{token: token, user: user}) do
    %{result: "success", token: token, user: parse_user(user)}
  end

  def parse_user(user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      type: user.type
    }
  end
end
