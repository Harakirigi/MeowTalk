defmodule MeowTalk.AccountsTest do
  use MeowTalk.DataCase

  alias MeowTalk.Accounts

  describe "cats" do
    alias MeowTalk.Accounts.Cat

    import MeowTalk.AccountsFixtures

    @invalid_attrs %{name: nil, email: nil, password_hash: nil, breed: nil, age: nil, bio: nil, avatar_url: nil, cattitude_level: nil, is_vip: nil}

    test "list_cats/0 returns all cats" do
      cat = cat_fixture()
      assert Accounts.list_cats() == [cat]
    end

    test "get_cat!/1 returns the cat with given id" do
      cat = cat_fixture()
      assert Accounts.get_cat!(cat.id) == cat
    end

    test "create_cat/1 with valid data creates a cat" do
      valid_attrs = %{name: "some name", email: "some email", password_hash: "some password_hash", breed: "some breed", age: 42, bio: "some bio", avatar_url: "some avatar_url", cattitude_level: 42, is_vip: true}

      assert {:ok, %Cat{} = cat} = Accounts.create_cat(valid_attrs)
      assert cat.name == "some name"
      assert cat.email == "some email"
      assert cat.password_hash == "some password_hash"
      assert cat.breed == "some breed"
      assert cat.age == 42
      assert cat.bio == "some bio"
      assert cat.avatar_url == "some avatar_url"
      assert cat.cattitude_level == 42
      assert cat.is_vip == true
    end

    test "create_cat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_cat(@invalid_attrs)
    end

    test "update_cat/2 with valid data updates the cat" do
      cat = cat_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", password_hash: "some updated password_hash", breed: "some updated breed", age: 43, bio: "some updated bio", avatar_url: "some updated avatar_url", cattitude_level: 43, is_vip: false}

      assert {:ok, %Cat{} = cat} = Accounts.update_cat(cat, update_attrs)
      assert cat.name == "some updated name"
      assert cat.email == "some updated email"
      assert cat.password_hash == "some updated password_hash"
      assert cat.breed == "some updated breed"
      assert cat.age == 43
      assert cat.bio == "some updated bio"
      assert cat.avatar_url == "some updated avatar_url"
      assert cat.cattitude_level == 43
      assert cat.is_vip == false
    end

    test "update_cat/2 with invalid data returns error changeset" do
      cat = cat_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_cat(cat, @invalid_attrs)
      assert cat == Accounts.get_cat!(cat.id)
    end

    test "delete_cat/1 deletes the cat" do
      cat = cat_fixture()
      assert {:ok, %Cat{}} = Accounts.delete_cat(cat)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_cat!(cat.id) end
    end

    test "change_cat/1 returns a cat changeset" do
      cat = cat_fixture()
      assert %Ecto.Changeset{} = Accounts.change_cat(cat)
    end
  end
end
