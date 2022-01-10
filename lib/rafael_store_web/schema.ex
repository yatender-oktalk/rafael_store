defmodule RafaelStoreWeb.Schema do
  @moduledoc """
  This module contains the GraphQL schema endpoints
  """
  use Absinthe.Schema

  query do
    field :menu_items, list_of(:menu_item) do
      resolve(fn _, _, _ ->
        {:ok, [%{id: 123, name: "Yatender", description: "hello"}, %{id: 234, name: "yatnder2", description: "other description"}]}
      end)
    end
  end

  object :menu_item do
    field :id, :id
    field :name, :string
    field :description, :string
  end
end
