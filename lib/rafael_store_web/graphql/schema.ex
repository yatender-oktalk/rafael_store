defmodule RafaelStoreWeb.Schema do
  @moduledoc """
  This module contains the GraphQL schema endpoints
  """
  use Absinthe.Schema

  import_fields RafaelStoreWeb.GraphQL.Schema.MenuTypes

  @desc """
  This query return the user data
  we can either filter based on name
  """
  query do
    import_fields :user_queries
    import_fields :blog_queries
  end
end
