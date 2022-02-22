defmodule RafaelStore.Repo.Migrations.AddCategoryTagsToBlog do
  use Ecto.Migration

  def change do
    alter table("blogs") do
      add :category_id, references(:categories, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)
    end
    create index(:blogs, [:tag_id])
    create index(:blogs, [:category_id])
  end
end
