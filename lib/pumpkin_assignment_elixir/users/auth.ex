defmodule PumpkinAssignmentElixir.Users.Auth do
  alias PumpkinAssignmentElixir.Users

  def authenticate(email, password) do
    case Users.get_user_by_email(email) do
      {:error, _} ->
        {:error, "Invalid Credentials"}

      user ->
        case check_password(user, password) do
          :invalid_credentials -> {:error, "Invalid Credentials"}
          :inactive -> {:error, "User Id is inactive"}
          _ -> {:ok, user}
        end
    end
  end

  defp check_password(nil, _) do
    false
  end

  defp check_password(user, password) do
    case user.password == password do
      true ->
        user

      false ->
        :invalid_credentials
    end
  end
end
