defmodule RafaelStore.Accounts.Blogs do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :name, :string
    field :text, :string

    belongs_to :user, RafaelStore.Accounts.User
    belongs_to :category, RafaelStore.Menu.Category
    belongs_to :tag, RafaelStore.Menu.Tag

    timestamps()
  end

  @doc false
  def changeset(blogs, attrs) do
    blogs
    |> cast(attrs, [:name, :text])
    |> validate_required([:name, :text])
  end
end
