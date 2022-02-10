defmodule RafaelStore.Resolver.Blog do
  @moduledoc """
  This module is the resolver for user related APIs of GraphQL
  """

  alias RafaelStore.Accounts
  alias RafaelStore.Accounts.Blogs

  import Ecto.Query
  alias RafaelStore.Repo

  def list_blog(_, %{filter: _filter, order: _order} = filters, _) do
    {:ok, build_query(filters)}
  end

  def list_blog(_, _args, _) do
    {:ok, Accounts.list_blogs()}
  end

  def build_query(%{filter: filter, order: order}) do
    filter
    |> Enum.reduce(Blogs, fn
      {_, nil}, query ->
        query

      {:user_id, user_id}, query ->
        from q in query, where: q.user_id == ^user_id

      {:name, name}, query ->
        from q in query, where: q.name == ^name
    end)
    |> order_by([q], {^order, q.inserted_at})
    |> Repo.all()
  end
end
