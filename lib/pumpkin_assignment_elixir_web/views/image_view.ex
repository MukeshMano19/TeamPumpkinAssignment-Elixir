defmodule PumpkinAssignmentElixirWeb.ImageView do
  use PumpkinAssignmentElixirWeb, :view
  alias PumpkinAssignmentElixirWeb.ImageView

  def render("index.json", %{images: images}) do
    %{data: render_many(images, ImageView, "image.json", as: :image)}
  end

  def render("show.json", %{image: image}) do
    %{data: render_one(image, ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{
      id: image.id,
      name: image.name,
      category: image.category,
      total_downloads: image.total_downloads,
      contributor: image.contributor.name
    }
  end
end
