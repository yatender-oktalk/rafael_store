defmodule RafaelStoreWeb.GraphQL.Schema.MenuTypes do
  @moduledoc """
  This module contains the types for schema
  """

  use Absinthe.Schema.Notation

  input_object :user_filter do
    field :phone, :string
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
