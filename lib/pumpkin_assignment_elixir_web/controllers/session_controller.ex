defmodule PumpkinAssignmentElixirWeb.SessionController do
  use PumpkinAssignmentElixirWeb, :controller
  alias PumpkinAssignmentElixir.Users.Auth
  action_fallback PumpkinAssignmentElixir.FallbackController

  def login(conn, %{"email" => email_id, "password" => password}) do
    email = String.downcase(email_id)

    case Auth.authenticate(email, password) do
      {:ok, user} ->
        conn = PumpkinAssignmentElixir.Guardian.Plug.sign_in(conn, user)

        render(conn, "success.json", %{
          user: user,
          token: PumpkinAssignmentElixir.Guardian.Plug.current_token(conn)
        })

      {:error, message} ->
        {:error, message}
    end
  end

  def logout(conn, _params) do
    jwt = PumpkinAssignmentElixir.Guardian.Plug.current_token(conn)
    {:ok, _claims} = PumpkinAssignmentElixir.Guardian.revoke(jwt)

    json(conn, %{message: "Logout Success"})
  end
end
