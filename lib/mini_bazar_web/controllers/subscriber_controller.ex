defmodule MiniBazarWeb.SubscriberController do
  use MiniBazarWeb, :controller

  alias MiniBazar.CRM
  alias MiniBazar.CRM.Subscriber

  def index(conn, _params) do
    subscribers = CRM.list_subscribers()
    render(conn, "index.html", subscribers: subscribers)
  end

  def new(conn, _params) do
    changeset = CRM.change_subscriber(%Subscriber{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"subscriber" => subscriber_params}) do
    case CRM.create_subscriber(subscriber_params) do
      {:ok, subscriber} ->
        conn
        |> put_flash(:info, "Subscriber created successfully.")
        |> redirect(to: Routes.subscriber_path(conn, :show, subscriber))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    subscriber = CRM.get_subscriber!(id)
    render(conn, "show.html", subscriber: subscriber)
  end

  def edit(conn, %{"id" => id}) do
    subscriber = CRM.get_subscriber!(id)
    changeset = CRM.change_subscriber(subscriber)
    render(conn, "edit.html", subscriber: subscriber, changeset: changeset)
  end

  def update(conn, %{"id" => id, "subscriber" => subscriber_params}) do
    subscriber = CRM.get_subscriber!(id)

    case CRM.update_subscriber(subscriber, subscriber_params) do
      {:ok, subscriber} ->
        conn
        |> put_flash(:info, "Subscriber updated successfully.")
        |> redirect(to: Routes.subscriber_path(conn, :show, subscriber))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", subscriber: subscriber, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    subscriber = CRM.get_subscriber!(id)
    {:ok, _subscriber} = CRM.delete_subscriber(subscriber)

    conn
    |> put_flash(:info, "Subscriber deleted successfully.")
    |> redirect(to: Routes.subscriber_path(conn, :index))
  end
end
