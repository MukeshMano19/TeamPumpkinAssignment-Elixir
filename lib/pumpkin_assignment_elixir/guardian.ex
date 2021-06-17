defmodule PumpkinAssignmentElixir.Guardian do
  use Guardian, otp_app: :pumpkin_assignment_elixir
  alias PumpkinAssignmentElixir.Users.User
  alias PumpkinAssignmentElixir.Users

  def subject_for_token(%User{} = user, _claims) do
    sub = "user:#{user.id}"

    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :no_subject}
  end

  def resource_from_claims(%{"sub" => "user:" <> user_id}) do
    resource = Users.get_user!(user_id)
    {:ok, resource}
  end

  def resource_from_claims(_claims) do
    {:error, :invalid_token}
  end
end
