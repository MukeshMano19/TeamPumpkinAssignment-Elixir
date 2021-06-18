defmodule PumpkinAssignmentElixirWeb.ImageController do
  use PumpkinAssignmentElixirWeb, :controller
  alias PumpkinAssignmentElixir.Images
  alias PumpkinAssignmentElixir.Images.Image

  action_fallback PumpkinAssignmentElixirWeb.FallbackController

  def index(conn, params) do
    images = Images.list_images(params)
    render(conn, "index.json", images: images)
  end

  def create(conn, params) do
    case Images.create_image(params) do
      {:ok, %Image{} = image} ->
        json(conn, %{message: "Success"})

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def get_image(conn, %{"id" => id}) do
    image = Images.get_image!(id)

    conn
    |> put_resp_content_type("png")
    |> send_resp(200, image.image_binary)
  end

  def download_image(conn, %{"id" => id}) do
    image = Images.get_image!(id)

    conn
    |> put_resp_content_type("image/png")
    |> put_resp_header("content-disposition", "attachment; filename=#{image.name}.png")
    |> send_resp(200, image.image_binary)
  end

  def update_total_downloads(conn, %{"id" => id}) do
    _image = Images.update_total_downloads(id)
    json(conn, %{message: "Success"})
  end
end
