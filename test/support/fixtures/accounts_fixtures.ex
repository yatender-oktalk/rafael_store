defmodule RafaelStore.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RafaelStore.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name",
        phone: "some phone"
      })
      |> RafaelStore.Accounts.create_user()

    user
  end

  @doc """
  Generate a blogs.
  """
  def blogs_fixture(attrs \\ %{}) do
    {:ok, blogs} =
      attrs
      |> Enum.into(%{
        name: "some name",
        text: "some text"
      })
      |> RafaelStore.Accounts.create_blogs()

    blogs
  end
end
