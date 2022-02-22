defmodule RafaelStore.Repo.Migrations.CreateBlogsTaggins do
  use Ecto.Migration

  def change do
    create table(:blogs_taggins) do
      add :blog_id, references(:blogs, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps()
    end

    create index(:blogs_taggins, [:blog_id])
    create index(:blogs_taggins, [:tag_id])
  end
end
