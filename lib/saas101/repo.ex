defmodule Saas101.Repo do
  use Ecto.Repo,
    otp_app: :saas101,
    adapter: Ecto.Adapters.Postgres
end
