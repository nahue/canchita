defmodule Saas101Web.Router do
  use Saas101Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :public do
    plug :browser
    plug :put_root_layout, {Saas101Web.LayoutView, :root}
  end

  pipeline :auth do
    plug :browser
    plug :put_root_layout, {Saas101Web.LayoutView, :auth}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug :browser
    plug :put_root_layout, {Saas101Web.LayoutView, :protected}

    plug Pow.Plug.RequireAuthenticated,
      error_handler: Saas101Web.AuthErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
      error_handler: Saas101Web.AuthErrorHandler
  end

  scope "/app", Saas101Web do
    pipe_through :protected
    resources "/canchas", CanchaController
    resources "/locales", LocalController
    resources "/clientes", ClienteController
    resources "/turnos", TurnoController
    resources "/horarios", HorarioController
    get "/", DashboardController, :index
  end

  scope "/", Saas101Web do
    pipe_through [:public, :not_authenticated]
    get "/", PageController, :index
  end

  scope "/", Saas101Web do
    pipe_through [:auth, :not_authenticated]

    get "/signup", RegistrationController, :new, as: :signup
    post "/signup", RegistrationController, :create, as: :signup
    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
  end

  scope "/", Saas101Web do
    pipe_through [:auth, :protected]

    delete "/logout", SessionController, :delete, as: :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", Saas101Web do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/phx_dashboard", metrics: Saas101Web.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
