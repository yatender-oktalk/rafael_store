defmodule RafaelStoreWeb.Resolver.UserTest do
  @moduledoc """
  This module is the test suite of user resolver
  """
  use RafaelStoreWeb.ConnCase, async: true
  alias RafaelStore.Accounts

  setup do
    Accounts.create_user(%{age: 10, name: "yatender", phone: "8105139417"})
    Accounts.create_user(%{age: 11, name: "yatender-1", phone: "8105139417-1"})
    Accounts.create_user(%{age: 12, name: "yatender-2", phone: "8105139417-2"})
    Accounts.create_user(%{age: 12, name: "yatender-3", phone: "8105139417-3"})
    %{}
  end

  @query """
  query FetchUsers($term: UserFilter) {
    userList(filter: $term) {
      name
      age
    }
  }
  """

  @valid_term %{"term" => %{"phone" => "8105139417"}}
  @invalid_term %{"term" => %{"phone" => "81051394"}}

  test "user list test" do
    conn = build_conn()
    conn = get conn, "/api", query: @query, variables: @valid_term
    resp = json_response(conn, 200)
    assert resp["data"] == %{"userList" => [%{"age" => "10", "name" => "yatender"}]}
  end

  test "user list test when using the bad value" do
    conn = build_conn()
    conn = get conn, "/api", query: @query, variables: @invalid_term
    resp = json_response(conn, 200)
    assert resp["data"] == %{"userList" => []}
  end
end
