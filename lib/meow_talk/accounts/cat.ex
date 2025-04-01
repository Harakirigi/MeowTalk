defmodule MeowTalk.Accounts.Cat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cats" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :breed, :string
    field :age, :integer
    field :bio, :string
    field :avatar_url, :string
    field :cattitude_level, :integer
    field :is_vip, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cat, attrs) do
    cat
    |> cast(attrs, [:name, :email, :password_hash, :breed, :age, :bio, :avatar_url, :cattitude_level, :is_vip])
    |> validate_required([:name, :email, :password_hash, :breed, :age, :bio, :avatar_url, :cattitude_level, :is_vip])
    |> unique_constraint(:email)
    |> unique_constraint(:name)
  end
end
