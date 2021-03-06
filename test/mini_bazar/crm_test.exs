defmodule MiniBazar.CRMTest do
  use MiniBazar.DataCase

  alias MiniBazar.CRM

  describe "subscribers" do
    alias MiniBazar.CRM.Subscriber

    @valid_attrs %{email: "some email", lastnames: "some lastnames", name: "some name", verified?: true}
    @update_attrs %{email: "some updated email", lastnames: "some updated lastnames", name: "some updated name", verified?: false}
    @invalid_attrs %{email: nil, lastnames: nil, name: nil, verified?: nil}

    def subscriber_fixture(attrs \\ %{}) do
      {:ok, subscriber} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CRM.create_subscriber()

      subscriber
    end

    test "list_subscribers/0 returns all subscribers" do
      subscriber = subscriber_fixture()
      assert CRM.list_subscribers() == [subscriber]
    end

    test "get_subscriber!/1 returns the subscriber with given id" do
      subscriber = subscriber_fixture()
      assert CRM.get_subscriber!(subscriber.id) == subscriber
    end

    test "create_subscriber/1 with valid data creates a subscriber" do
      assert {:ok, %Subscriber{} = subscriber} = CRM.create_subscriber(@valid_attrs)
      assert subscriber.email == "some email"
      assert subscriber.lastnames == "some lastnames"
      assert subscriber.name == "some name"
      assert subscriber.verified? == true
    end

    test "create_subscriber/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CRM.create_subscriber(@invalid_attrs)
    end

    test "update_subscriber/2 with valid data updates the subscriber" do
      subscriber = subscriber_fixture()
      assert {:ok, %Subscriber{} = subscriber} = CRM.update_subscriber(subscriber, @update_attrs)
      assert subscriber.email == "some updated email"
      assert subscriber.lastnames == "some updated lastnames"
      assert subscriber.name == "some updated name"
      assert subscriber.verified? == false
    end

    test "update_subscriber/2 with invalid data returns error changeset" do
      subscriber = subscriber_fixture()
      assert {:error, %Ecto.Changeset{}} = CRM.update_subscriber(subscriber, @invalid_attrs)
      assert subscriber == CRM.get_subscriber!(subscriber.id)
    end

    test "delete_subscriber/1 deletes the subscriber" do
      subscriber = subscriber_fixture()
      assert {:ok, %Subscriber{}} = CRM.delete_subscriber(subscriber)
      assert_raise Ecto.NoResultsError, fn -> CRM.get_subscriber!(subscriber.id) end
    end

    test "change_subscriber/1 returns a subscriber changeset" do
      subscriber = subscriber_fixture()
      assert %Ecto.Changeset{} = CRM.change_subscriber(subscriber)
    end
  end
end
