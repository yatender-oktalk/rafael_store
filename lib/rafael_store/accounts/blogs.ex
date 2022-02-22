defmodule RafaelStore.Accounts.Blogs do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :name, :string
    field :text, :string

    belongs_to :user, RafaelStore.Accounts.User
    belongs_to :category, RafaelStore.Menu.Category
    many_to_many :tags, RafaelStore.Menu.Tag, join_through: "blogs_taggings"

    timestamps()
  end

  @doc false
  def changeset(blogs, attrs) do
    blogs
    |> cast(attrs, [:name, :text, :user_id])
    |> validate_required([:name, :text])
    |> foreign_key_constraint(:category, name: :blogs_category_id_fkey)
    |> foreign_key_constraint(:user, name: :blogs_user_id_fkey)
    |> foreign_key_constraint(:tags, name: :blogs_tags_fkey)
    |> put_assoc(:category, [:name])
  end
end
