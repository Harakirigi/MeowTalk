defmodule MeowTalk.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MeowTalk.Accounts` context.
  """

  @doc """
  Generate a unique cat email.
  """
  def unique_cat_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique cat name.
  """
  def unique_cat_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a cat.
  """
  def cat_fixture(attrs \\ %{}) do
    {:ok, cat} =
      attrs
      |> Enum.into(%{
        age: 42,
        avatar_url: "some avatar_url",
        bio: "some bio",
        breed: "some breed",
        cattitude_level: 42,
        email: unique_cat_email(),
        is_vip: true,
        name: unique_cat_name(),
        password_hash: "some password_hash"
      })
      |> MeowTalk.Accounts.create_cat()

    cat
  end
end
