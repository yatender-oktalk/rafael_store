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
