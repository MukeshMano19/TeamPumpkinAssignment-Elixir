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
  end

  scope "/api", PumpkinAssignmentElixirWeb do
    pipe_through([:api, :authenticate])

    post("/user/logout", SessionController, :logout)
  end
end
