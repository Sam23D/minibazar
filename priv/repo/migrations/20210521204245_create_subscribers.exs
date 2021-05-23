defmodule MiniBazar.Repo.Migrations.CreateSubscribers do
  use Ecto.Migration

  def change do
    create table(:subscribers) do
      add :name, :string
      add :lastnames, :string
      add :email, :string
      add :verified?, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:subscribers, [:email])
  end
end
