defmodule PumpkinAssignmentElixir.Repo do
  use Ecto.Repo,
    otp_app: :pumpkin_assignment_elixir,
    adapter: Ecto.Adapters.Postgres
end
