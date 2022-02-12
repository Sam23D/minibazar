defmodule MiniBazar.Repo.Migrations.CreatesShopcart do
  use Ecto.Migration

  def change do
    create table(:shopcarts)do
      add :line_items, :map
      add :subscriber_id, references(:subscribers)

      timestamps()
    end

  end
end
