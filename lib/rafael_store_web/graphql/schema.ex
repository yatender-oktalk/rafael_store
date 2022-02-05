defmodule RafaelStoreWeb.Schema do
  @moduledoc """
  This module contains the GraphQL schema endpoints
  """
  use Absinthe.Schema

  alias RafaelStore.Resolver

  @desc """
  This query return the user data
  we can either filter based on name
  """
  query do
    @desc "Returns the user list"
    field :user_list, list_of(:user) do
      arg(:name, :string)
      arg(:order, :sort_order, default_value: :asc)
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
    value(:asc)
    value(:desc)
  end
end
