# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RafaelStore.Repo.insert!(%RafaelStore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RafaelStore.Accounts.User
# alias RafaelStore.Accounts.Blogs

# alias RafaelStore.Menu.BlogTags
alias RafaelStore.Menu.Category
alias RafaelStore.Menu.Tag
alias RafaelStore.Menu

alias RafaelStore.Accounts
alias RafaelStore.Repo

Repo.delete_all(User)

{:ok, u1} = Accounts.create_user(%{age: 10, name: "yatender", phone: "8105139417"})
{:ok, u2} = Accounts.create_user(%{age: 11, name: "yatender-1", phone: "8105139417-1"})
{:ok, u3} = Accounts.create_user(%{age: 12, name: "yatender-2", phone: "8105139417-2"})
{:ok, u4} = Accounts.create_user(%{age: 12, name: "yatender-3", phone: "8105139417-3"})

# Create category
Repo.delete_all(Category)
{:ok, cat1} = Menu.create_category(%{name: "Category1"})
{:ok, cat2} = Menu.create_category(%{name: "Category2"})
{:ok, cat3} = Menu.create_category(%{name: "Category3"})

# Create tag
Repo.delete_all(Tag)
Menu.create_tag(%{name: "tag1"})
Menu.create_tag(%{name: "tag2"})
Menu.create_tag(%{name: "tag3"})

# create blogs
Accounts.create_blogs(%{name: "Blog1", user_id: 1, category_id: cat1.id})
Accounts.create_blogs(%{name: "Blog2", user_id: 1, category_id: cat2.id})
Accounts.create_blogs(%{name: "Blog3", user_id: 3, category_id: cat3.id})
Accounts.create_blogs(%{name: "Blog4", user_id: 2, category_id: cat1.id})
Accounts.create_blogs(%{name: "Blog5", user_id: 4, category_id: cat2.id})
Accounts.create_blogs(%{name: "Blog6", user_id: 3, category_id: cat3.id})
Accounts.create_blogs(%{name: "Blog6", user_id: 2, category_id: cat2.id})
