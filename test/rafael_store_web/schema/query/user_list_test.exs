defmodule RafaelStoreWeb.Schema.Query.UserListTest do
  @moduledoc """
  Test to check user list
  """

  use RafaelStoreWeb.ConnCase, async: true

  # alias RafaelStore.Accounts.User
  alias RafaelStore.Accounts
  # alias RafaelStore.Repo

  setup do
    Accounts.create_user(%{age: 10, name: "yatender", phone: "8105139417"})
    Accounts.create_user(%{age: 11, name: "yatender-1", phone: "8105139417-1"})
    Accounts.create_user(%{age: 12, name: "yatender-2", phone: "8105139417-2"})
    Accounts.create_user(%{age: 12, name: "yatender-3", phone: "8105139417-3"})
    %{}
  end

  @query """
  query FetchUsers {
    userList {
      name
      age
    }
  }
  """

  test "users list returns all the users" do
    conn = build_conn()
    conn = get conn, "/api", query: @query
    resp = json_response(conn, 200)
    assert resp["data"] == %{"userList" => [%{"age" => "10", "name" => "yatender"}, %{"age" => "11", "name" => "yatender-1"}, %{"age" => "12", "name" => "yatender-2"}, %{"age" => "12", "name" => "yatender-3"}]}
  end
end
