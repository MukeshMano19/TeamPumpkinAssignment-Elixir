defmodule PumpkinAssignmentElixirWeb.Router do
  use PumpkinAssignmentElixirWeb, :router

  pipeline :api do
    plug CORSPlug, origins: "*"
    plug :accepts, ["json"]
  end

  pipeline :authenticate do
    plug(PumpkinAssignmentElixirWeb.Plugs.GuardianAuthPipeline)
    plug(PumpkinAssignmentElixirWeb.Plugs.AssignUser)
  end

  scope "/api", PumpkinAssignmentElixirWeb do
    pipe_through :api
    post("/user/login", SessionController, :login)
    post("/user/signUp", UserController, :create)
    get("/image/:id", ImageController, :get_image)
    get("/image/:id/download", ImageController, :download_image)
  end

  scope "/api/user/:user_id", PumpkinAssignmentElixirWeb do
    pipe_through([:api, :authenticate])

    post("/logout", SessionController, :logout)

    get("/images", ImageController, :index)
    post("/image/upload", ImageController, :create)
    put("/image/:id/updateTotalDownloads", ImageController, :update_total_downloads)
  end
end
