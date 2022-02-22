
defmodule RafaelStore.Resolver.Search do
  @moduledoc """
  This module contains the search related function
  """

  # import Ecto.Query
  # alias RafaelStore.Repo

  def search(_, %{matching: term}, _) do
    # some combined search logic
    {:ok, []}
  end
end
