defmodule SpatrackerWeb.Router do
  use SpatrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpatrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    #resources "/users", UserController, except: [:new, :edit]
    #resources "/manages", ManageController, except: [:new, :edit]
    #resources "/time_blocks", Time_BlocksController, except: [:new, :edit]
    #resources "/tasks", TasksController, except: [:new, :edit]

    get "/users", PageController, :index
    get "/manages", PageController, :index
    get "/time_blocks", PageController, :index
    get "/tasks", PageController, :index

  end

  # Other scopes may use custom stacks.
   scope "/api/v1", SpatrackerWeb do
     pipe_through :api
     resources "/users", UserController, except: [:new, :edit]
     resources "/manages", ManageController, except: [:new, :edit]
     resources "/time_blocks", Time_BlocksController, except: [:new, :edit]
     resources "/tasks", TasksController, except: [:new, :edit]
   end
end
