defmodule PumpkinAssignmentElixir.Images do
  @moduledoc """
  The Images context.
  """

  import Ecto.Query, warn: false
  alias PumpkinAssignmentElixir.Repo

  alias PumpkinAssignmentElixir.Images.Image

  @doc """
  Returns the list of images.

  ## Examples

      iex> list_images()
      [%Image{}, ...]

  """
  def list_images(%{"user_id" => contributor_id, "NU" => _status}) do
    Repo.all(Image) |> Repo.preload(:contributor)
  end

  def list_images(%{"user_id" => contributor_id}) do
    Repo.all(from(i in Image, where: i.contributor_id == ^contributor_id))
    |> Repo.preload(:contributor)
  end

  @doc """
  Gets a single image.

  Raises `Ecto.NoResultsError` if the Image does not exist.

  ## Examples

      iex> get_image!(123)
      %Image{}

      iex> get_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_image!(id), do: Repo.get!(Image, id)

  @doc """
  Creates a image.

  ## Examples

      iex> create_image(%{field: value})
      {:ok, %Image{}}

      iex> create_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_image(%{"file" => file, "user_id" => user_id} = attrs \\ %{}) do
    {:ok, image_binary} = File.read(file.path)

    data =
      Map.put(attrs, "image_binary", image_binary)
      |> Map.put("contributor_id", String.to_integer(user_id))

    %Image{}
    |> Image.changeset(data)
    |> Repo.insert()
  end

  @doc """
  Updates a image.

  ## Examples

      iex> update_image(image, %{field: new_value})
      {:ok, %Image{}}

      iex> update_image(image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_image(%Image{} = image, attrs) do
    image
    |> Image.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a image.

  ## Examples

      iex> delete_image(image)
      {:ok, %Image{}}

      iex> delete_image(image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_image(%Image{} = image) do
    Repo.delete(image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking image changes.

  ## Examples

      iex> change_image(image)
      %Ecto.Changeset{source: %Image{}}

  """
  def change_image(%Image{} = image) do
    Image.changeset(image, %{})
  end
end
