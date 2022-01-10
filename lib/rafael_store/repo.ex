defmodule RafaelStore.Repo do
  use Ecto.Repo,
    otp_app: :rafael_store,
    adapter: Ecto.Adapters.Postgres
end
