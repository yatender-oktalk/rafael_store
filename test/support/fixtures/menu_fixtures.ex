defmodule RafaelStore.MenuFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RafaelStore.Menu` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> RafaelStore.Menu.create_category()

    category
  end

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> RafaelStore.Menu.create_tag()

    tag
  end

  @doc """
  Generate a blog_tags.
  """
  def blog_tags_fixture(attrs \\ %{}) do
    {:ok, blog_tags} =
      attrs
      |> Enum.into(%{

      })
      |> RafaelStore.Menu.create_blog_tags()

    blog_tags
  end
end
