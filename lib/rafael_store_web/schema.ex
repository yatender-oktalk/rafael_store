defmodule RafaelStoreWeb.Schema do
  @moduledoc """
  This module contains the GraphQL schema endpoints
  """
  use Absinthe.Schema

  alias RafaelStore.Resolver

  query do
    field :user_list, list_of(:user) do
      arg(:name, :string)
      arg(:order_by, :sort_order, default_value: :asc)
      resolve(&Resolver.User.list_users/3)
    end
  end

  object :user do
    field :id, :id
    field :age, :string
    field :name, :string
    field :phone, :string
    field :created_at, :string
  end

  enum :sort_order do
    value :asc
    value :desc
  end
end
