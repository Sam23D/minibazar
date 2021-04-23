defmodule MiniBazar.Repo do
  use Ecto.Repo,
    otp_app: :mini_bazar,
    adapter: Ecto.Adapters.Postgres
end
