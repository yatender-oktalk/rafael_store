defmodule RafaelStore.Accounts.Blogs do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :name, :string
    field :text, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(blogs, attrs) do
    blogs
    |> cast(attrs, [:name, :text])
    |> validate_required([:name, :text])
  end
end
