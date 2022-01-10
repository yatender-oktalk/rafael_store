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
alias RafaelStore.Accounts
alias RafaelStore.Repo

Repo.delete_all(User)

Accounts.create_user(%{age: 10, name: "yatender", phone: "8105139417"})
Accounts.create_user(%{age: 11, name: "yatender-1", phone: "8105139417-1"})
Accounts.create_user(%{age: 12, name: "yatender-2", phone: "8105139417-2"})
Accounts.create_user(%{age: 12, name: "yatender-3", phone: "8105139417-3"})
