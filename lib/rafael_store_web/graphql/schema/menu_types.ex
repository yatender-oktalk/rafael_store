defmodule RafaelStoreWeb.GraphQL.Schema.MenuTypes do
  @moduledoc """
  This module contains the types for schema
  """

  use Absinthe.Schema.Notation

  alias RafaelStore.Resolver

  object :user_queries do
    field :user_list, list_of(:user) do
      arg(:filter, :user_filter)
      arg(:order, :sort_order, default_value: :asc)
      resolve(&Resolver.User.list_users/3)
    end
  end

  object :blog_queries do
    field :blog_list, list_of(:blogs) do
      arg(:filter, :blog_filter)
      arg(:order, :sort_order, default_value: :asc)
      resolve(&Resolver.Blog.list_blog/3)
    end
  end

  object :category do
    field :name, :string
    field :items
  end
  # object :search_query do
  #   field :search, list_of(:search_results) do
  #     arg :matching,  non_null(:string)
  #     resolve(&Resolver.Search.search/1)
  #   end
  # end

  object :blog do
    field :name, :string
    field :text, :string

  end

  input_object :user_filter do
    field :phone, :string
  end

  input_object :blog_filter do
    field :name, :string
    field :user_id, :id
  end

  object :user do
    field :id, :id
    field :age, :string
    field :name, :string
    field :phone, :string
    field :inserted_at, :date
  end

  object :blogs do
    field :id, :id
    field :name, :string
    field :text, :string
    field :user_id, :id
    field :inserted_at, :date
  end

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  scalar :date do
    parse fn input ->
      # Parsing logic here for scalar type
      case Date.from_iso8601(input.value) do
        {:ok, data} -> {:ok, data}
        _ -> :error
      end
    end

    serialize fn date ->
      # Serialization logic here
      Date.to_iso8601(date)
    end
  end
end
