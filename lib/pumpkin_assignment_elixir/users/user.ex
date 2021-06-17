defmodule PumpkinAssignmentElixir.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :type, :string
    field(:password, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :type, :password])
    |> validate_required([:name, :email, :type, :password])
    |> unique_constraint(:email, message: "Email already taken!")
  end
end
