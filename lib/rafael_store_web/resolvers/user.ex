defmodule RafaelStore.Resolver.User do
  @moduledoc """
  This module is the resolver for user related APIs of GraphQL
  """

  alias RafaelStore.Repo
  alias RafaelStore.Accounts
  alias RafaelStore.Accounts.User

  def list_users(_, %{name: name, order_by: _order_by}, _) do
    {:ok, Accounts.get_user(%{name: name})}
  end

  def list_users(_, _args, _) do
    {:ok, Repo.all(User)}
  end
end
