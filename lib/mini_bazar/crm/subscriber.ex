defmodule MiniBazar.CRM.Subscriber do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscribers" do
    field :email, :string
    field :lastnames, :string
    field :name, :string
    field :terms_accepted?, :boolean
    field :verified?, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(subscriber, attrs) do
    subscriber
    |> cast(attrs, [:name, :lastnames, :email, :terms_accepted?])
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/ )
    |> unique_constraint(:email, message: "Ese correo ya esta suscrito!")
  end
  
  # def validate_email_changeset
  
end
