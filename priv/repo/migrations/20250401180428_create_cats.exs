defmodule MeowTalk.Repo.Migrations.CreateCats do
  use Ecto.Migration

  def change do
    create table(:cats) do
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :breed, :string
      add :age, :integer
      add :bio, :text
      add :avatar_url, :string
      add :cattitude_level, :integer
      add :is_vip, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:cats, [:email])
    create unique_index(:cats, [:name])
  end
end
