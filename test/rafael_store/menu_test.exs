defmodule RafaelStore.MenuTest do
  use RafaelStore.DataCase

  alias RafaelStore.Menu

  describe "categories" do
    alias RafaelStore.Menu.Category

    import RafaelStore.MenuFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Menu.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Menu.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = Menu.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = Menu.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_category(category, @invalid_attrs)
      assert category == Menu.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Menu.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Menu.change_category(category)
    end
  end

  describe "tags" do
    alias RafaelStore.Menu.Tag

    import RafaelStore.MenuFixtures

    @invalid_attrs %{name: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Menu.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Menu.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tag{} = tag} = Menu.create_tag(valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tag{} = tag} = Menu.update_tag(tag, update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_tag(tag, @invalid_attrs)
      assert tag == Menu.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Menu.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Menu.change_tag(tag)
    end
  end

  describe "blogs_taggins" do
    alias RafaelStore.Menu.BlogTags

    import RafaelStore.MenuFixtures

    @invalid_attrs %{}

    test "list_blogs_taggins/0 returns all blogs_taggins" do
      blog_tags = blog_tags_fixture()
      assert Menu.list_blogs_taggins() == [blog_tags]
    end

    test "get_blog_tags!/1 returns the blog_tags with given id" do
      blog_tags = blog_tags_fixture()
      assert Menu.get_blog_tags!(blog_tags.id) == blog_tags
    end

    test "create_blog_tags/1 with valid data creates a blog_tags" do
      valid_attrs = %{}

      assert {:ok, %BlogTags{} = blog_tags} = Menu.create_blog_tags(valid_attrs)
    end

    test "create_blog_tags/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Menu.create_blog_tags(@invalid_attrs)
    end

    test "update_blog_tags/2 with valid data updates the blog_tags" do
      blog_tags = blog_tags_fixture()
      update_attrs = %{}

      assert {:ok, %BlogTags{} = blog_tags} = Menu.update_blog_tags(blog_tags, update_attrs)
    end

    test "update_blog_tags/2 with invalid data returns error changeset" do
      blog_tags = blog_tags_fixture()
      assert {:error, %Ecto.Changeset{}} = Menu.update_blog_tags(blog_tags, @invalid_attrs)
      assert blog_tags == Menu.get_blog_tags!(blog_tags.id)
    end

    test "delete_blog_tags/1 deletes the blog_tags" do
      blog_tags = blog_tags_fixture()
      assert {:ok, %BlogTags{}} = Menu.delete_blog_tags(blog_tags)
      assert_raise Ecto.NoResultsError, fn -> Menu.get_blog_tags!(blog_tags.id) end
    end

    test "change_blog_tags/1 returns a blog_tags changeset" do
      blog_tags = blog_tags_fixture()
      assert %Ecto.Changeset{} = Menu.change_blog_tags(blog_tags)
    end
  end
end
