defmodule RafaelStore.Menu do
  @moduledoc """
  The Menu context.
  """

  import Ecto.Query, warn: false
  alias RafaelStore.Repo

  alias RafaelStore.Menu.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias RafaelStore.Menu.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{data: %Tag{}}

  """
  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end

  alias RafaelStore.Menu.BlogTags

  @doc """
  Returns the list of blogs_taggins.

  ## Examples

      iex> list_blogs_taggins()
      [%BlogTags{}, ...]

  """
  def list_blogs_taggins do
    Repo.all(BlogTags)
  end

  @doc """
  Gets a single blog_tags.

  Raises `Ecto.NoResultsError` if the Blog tags does not exist.

  ## Examples

      iex> get_blog_tags!(123)
      %BlogTags{}

      iex> get_blog_tags!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blog_tags!(id), do: Repo.get!(BlogTags, id)

  @doc """
  Creates a blog_tags.

  ## Examples

      iex> create_blog_tags(%{field: value})
      {:ok, %BlogTags{}}

      iex> create_blog_tags(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blog_tags(attrs \\ %{}) do
    %BlogTags{}
    |> BlogTags.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a blog_tags.

  ## Examples

      iex> update_blog_tags(blog_tags, %{field: new_value})
      {:ok, %BlogTags{}}

      iex> update_blog_tags(blog_tags, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blog_tags(%BlogTags{} = blog_tags, attrs) do
    blog_tags
    |> BlogTags.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blog_tags.

  ## Examples

      iex> delete_blog_tags(blog_tags)
      {:ok, %BlogTags{}}

      iex> delete_blog_tags(blog_tags)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blog_tags(%BlogTags{} = blog_tags) do
    Repo.delete(blog_tags)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blog_tags changes.

  ## Examples

      iex> change_blog_tags(blog_tags)
      %Ecto.Changeset{data: %BlogTags{}}

  """
  def change_blog_tags(%BlogTags{} = blog_tags, attrs \\ %{}) do
    BlogTags.changeset(blog_tags, attrs)
  end
end
