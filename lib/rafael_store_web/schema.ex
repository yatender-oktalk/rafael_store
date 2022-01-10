defmodule RafaelStoreWeb.Schema do
  @moduledoc """
  This module contains the GraphQL schema endpoints
  """
  use Absinthe.Schema
  alias RafaelStore.Repo
  alias RafaelStore.Accounts.User

  query do
    field :user_list, list_of(:user) do
      resolve(fn _, _, _ ->
        {:ok, Repo.all(User)}
      end)
    end
  end

  object :user do
    field :id, :id
    field :age, :string
    field :name, :string
    field :phone, :string
    field :created_at, :string
  end
end
