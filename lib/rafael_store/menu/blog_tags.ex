defmodule RafaelStore.Menu.BlogTags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs_taggins" do

    field :blog_id, :id
    field :tag_id, :id

    timestamps()
  end

  @doc false
  def changeset(blog_tags, attrs) do
    blog_tags
    |> cast(attrs, [:blog_id, :tag_id])
    |> validate_required([:blog_id, :tag_id])
    |> foreign_key_constraint(:blog_id)
    |> foreign_key_constraint(:tag_id)
  end
end
