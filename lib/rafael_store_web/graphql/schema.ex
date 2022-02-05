defmodule RafaelStoreWeb.Schema do
  @moduledoc """
  This module contains the GraphQL schema endpoints
  """
  use Absinthe.Schema
  alias RafaelStore.Resolver

  import_types RafaelStoreWeb.GraphQL.Schema.MenuTypes

  @desc """
  This query return the user data
  we can either filter based on name
  """
  query do
    @desc "Returns the user list"
    field :user_list, list_of(:user) do
      arg(:filter, :user_filter)
      arg(:order, :sort_order, default_value: :asc)
      resolve(&Resolver.User.list_users/3)
    end
  end
end
