defmodule RafaelStoreWeb.Resolver.BlogTest do
  @moduledoc """
  This module is the test suite of user resolver
  """
  use RafaelStoreWeb.ConnCase, async: true
  alias RafaelStore.Accounts
  alias RafaelStore.Accounts.User

  setup do
    {:ok, %User{id: user_id}} = Accounts.create_user(%{age: 10, name: "yatender", phone: "8105139417"})
    Accounts.create_blogs(%{name: "yatender", text: "random text 8105139417", user_id: user_id})
    Accounts.create_blogs(%{name: "yatender-1", text: "random text 8105139417-1", user_id: user_id})
    Accounts.create_blogs(%{name: "yatender-2", text: "random text 8105139417-2", user_id: user_id})
    Accounts.create_blogs(%{name: "yatender-3", text: "random text 8105139417-3", user_id: user_id})
    %{}
  end

  @query """
  query FetchBlogs($term: BlogFilter) {
    blogList(filter: $term) {
      name
      text
    }
  }
  """

  @valid_term %{"term" => %{"name" => "yatender"}}
  @valid_term_2 %{"term" => %{"name" => "yatender-1"}}
  @invalid_term %{"term" => %{"name" => 909090}}

  test "blog list test" do
    conn = build_conn()
    conn = get conn, "/api", query: @query, variables: @valid_term
    resp = json_response(conn, 200)
    assert resp["data"] == %{"blogList" => [%{"name" => "yatender", "text" => "random text 8105139417"}]}

    # validate for another filter
    conn = build_conn()
    conn = get conn, "/api", query: @query, variables: @valid_term_2
    resp = json_response(conn, 200)
    assert resp["data"] == %{"blogList" => [%{"name" => "yatender-1", "text" => "random text 8105139417-1"}]}
  end

  test "blog list test when using the bad value" do
    conn = build_conn()
    conn = get conn, "/api", query: @query, variables: @invalid_term
    resp = json_response(conn, 200)
    assert resp["data"] == %{"blogList" => []}
  end
end
