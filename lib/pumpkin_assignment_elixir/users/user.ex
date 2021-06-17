defmodule PumpkinAssignmentElixir.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :type, :string
    field(:password, :string, virtual: true)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :type])
    |> validate_required([:name, :email, :type])
    |> unique_constraint(:email, message: "Email already taken!")
  end
end
