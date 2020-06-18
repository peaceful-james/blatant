defmodule Blatant.Repo do
  use Ecto.Repo,
    otp_app: :blatant,
    adapter: Ecto.Adapters.Postgres
end
