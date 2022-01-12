defmodule RafaelStore.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias RafaelStore.Repo

  alias RafaelStore.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_user(params) do
    Repo.get_by(User, params)
  end
  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias RafaelStore.Accounts.Blogs

  @doc """
  Returns the list of blogs.

  ## Examples

      iex> list_blogs()
      [%Blogs{}, ...]

  """
  def list_blogs do
    Repo.all(Blogs)
  end

  @doc """
  Gets a single blogs.

  Raises `Ecto.NoResultsError` if the Blogs does not exist.

  ## Examples

      iex> get_blogs!(123)
      %Blogs{}

      iex> get_blogs!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blogs!(id), do: Repo.get!(Blogs, id)

  @doc """
  Creates a blogs.

  ## Examples

      iex> create_blogs(%{field: value})
      {:ok, %Blogs{}}

      iex> create_blogs(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blogs(attrs \\ %{}) do
    %Blogs{}
    |> Blogs.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a blogs.

  ## Examples

      iex> update_blogs(blogs, %{field: new_value})
      {:ok, %Blogs{}}

      iex> update_blogs(blogs, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blogs(%Blogs{} = blogs, attrs) do
    blogs
    |> Blogs.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blogs.

  ## Examples

      iex> delete_blogs(blogs)
      {:ok, %Blogs{}}

      iex> delete_blogs(blogs)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blogs(%Blogs{} = blogs) do
    Repo.delete(blogs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blogs changes.

  ## Examples

      iex> change_blogs(blogs)
      %Ecto.Changeset{data: %Blogs{}}

  """
  def change_blogs(%Blogs{} = blogs, attrs \\ %{}) do
    Blogs.changeset(blogs, attrs)
  end
end
