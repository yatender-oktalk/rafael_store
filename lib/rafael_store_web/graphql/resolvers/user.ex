defmodule RafaelStore.Resolver.User do
  @moduledoc """
  This module is the resolver for user related APIs of GraphQL
  """

  alias RafaelStore.Accounts
  alias RafaelStore.Accounts.User

  import Ecto.Query
  alias RafaelStore.Repo

  def list_users(_, %{filter: _filter, order: _order} = filters, _) do
    {:ok, build_query(filters)}
  end

  def list_users(_, _args, _) do
    {:ok, Accounts.list_users()}
  end

  def build_query(%{filter: filter, order: order}) do
    filter
    |> Enum.reduce(User, fn
      {_, nil}, query ->
        query

      {:name, name}, query ->
        from q in query, where: q.name == ^name

      {:phone, phone}, query ->
        from q in query, where: q.phone == ^phone
    end)
    |> order_by([q], {^order, q.inserted_at})
    |> Repo.all()
  end
end
