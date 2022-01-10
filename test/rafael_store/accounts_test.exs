defmodule RafaelStore.AccountsTest do
  use RafaelStore.DataCase

  alias RafaelStore.Accounts

  describe "users" do
    alias RafaelStore.Accounts.User

    import RafaelStore.AccountsFixtures

    @invalid_attrs %{age: nil, name: nil, phone: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{age: 42, name: "some name", phone: "some phone"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.age == 42
      assert user.name == "some name"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{age: 43, name: "some updated name", phone: "some updated phone"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.age == 43
      assert user.name == "some updated name"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "blogs" do
    alias RafaelStore.Accounts.Blogs

    import RafaelStore.AccountsFixtures

    @invalid_attrs %{name: nil, text: nil}

    test "list_blogs/0 returns all blogs" do
      blogs = blogs_fixture()
      assert Accounts.list_blogs() == [blogs]
    end

    test "get_blogs!/1 returns the blogs with given id" do
      blogs = blogs_fixture()
      assert Accounts.get_blogs!(blogs.id) == blogs
    end

    test "create_blogs/1 with valid data creates a blogs" do
      valid_attrs = %{name: "some name", text: "some text"}

      assert {:ok, %Blogs{} = blogs} = Accounts.create_blogs(valid_attrs)
      assert blogs.name == "some name"
      assert blogs.text == "some text"
    end

    test "create_blogs/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_blogs(@invalid_attrs)
    end

    test "update_blogs/2 with valid data updates the blogs" do
      blogs = blogs_fixture()
      update_attrs = %{name: "some updated name", text: "some updated text"}

      assert {:ok, %Blogs{} = blogs} = Accounts.update_blogs(blogs, update_attrs)
      assert blogs.name == "some updated name"
      assert blogs.text == "some updated text"
    end

    test "update_blogs/2 with invalid data returns error changeset" do
      blogs = blogs_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_blogs(blogs, @invalid_attrs)
      assert blogs == Accounts.get_blogs!(blogs.id)
    end

    test "delete_blogs/1 deletes the blogs" do
      blogs = blogs_fixture()
      assert {:ok, %Blogs{}} = Accounts.delete_blogs(blogs)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_blogs!(blogs.id) end
    end

    test "change_blogs/1 returns a blogs changeset" do
      blogs = blogs_fixture()
      assert %Ecto.Changeset{} = Accounts.change_blogs(blogs)
    end
  end
end
