defmodule PumpkinAssignmentElixir.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset
  alias PumpkinAssignmentElixir.Users.User

  schema "images" do
    field :name, :string
    field :total_downloads, :integer, default: 0
    field :category, :integer
    field(:image_binary, :string)
    belongs_to :contributor, User

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:name, :total_downloads, :image_binary, :category, :contributor_id])
    |> validate_required([:name, :total_downloads])
  end

  def count_changeset(image, attrs) do
    image |> cast(attrs, [:total_downloads])
  end
end
