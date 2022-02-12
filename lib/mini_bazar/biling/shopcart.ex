defmodule MiniBazar.Biling.Shopcart do
  use Ecto.Schema
  import Ecto.Changeset

  alias MiniBazar.CRM.Subscriber

  # DB SCHEMA

  schema "shoping_carts" do
    field :line_items, :map


    belongs_to :subscriber, Subscriber

    timestamps()
  end


  # def changeset for shoping carts

  # PRIVATE API
  @spec remove_shopcart_item(map(), map()) :: map()
  def remove_shopcart_item(shopcart, item=%{ price: price, qty: qty }) do
    %{ shopcart | line_items: [ item | shopcart.line_items ] }
  end

  # TODO remove_shopcart_item(shopcart, item) do
  @spec remove_all_shopcart_items(map(), map()) :: map()
  def remove_all_shopcart_items(shopcart, item) do
    %{ shopcart | line_items: [ ] }
  end



end
