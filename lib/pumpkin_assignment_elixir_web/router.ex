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
    post("/sessions/login", SessionController, :login)
  end

  scope "/api", PumpkinAssignmentElixirWeb do
    pipe_through([:api, :authenticate])

    post("/sessions/logout", SessionController, :logout)
    resources "/users", UserController, except: [:delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PumpkinAssignmentElixirWeb do
  #   pipe_through :api
  # end
end
