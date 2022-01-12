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

  @query_name_filter """
  query FetchUsers {
    userList(name: "yatender-1") {
      name
      age
    }
  }
  """

  @query_name_filter_bad_val """
  query FetchUsers {
    userList(name: 1234) {
      name
      age
    }
  }
  """

  test "user list test" do
    conn = build_conn()
    conn = get conn, "/api", query: @query_name_filter
    resp = json_response(conn, 200)
    assert resp["data"] == %{"userList" => [%{"age" => "11", "name" => "yatender-1"}]}
  end

  test "user list test when using the bad value" do
    conn = build_conn()
    conn = get conn, "/api", query: @query_name_filter_bad_val
    resp = json_response(conn, 200)
    assert resp["data"] == nil
  end
end
