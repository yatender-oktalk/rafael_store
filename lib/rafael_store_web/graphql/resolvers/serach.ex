
defmodule RafaelStore.Resolver.Search do
  @moduledoc """
  This module contains the search related function
  """

  # import Ecto.Query
  alias RafaelStore.Repo

  def search(_, %{matching: _term}, _) do
    # some combined search logic
    {:ok, []}
  end

  def items_for_category(category, _args, _) do
    query = Ecto.assoc(category, :items)
    {:ok, Repo.all(query)}
  end
end
