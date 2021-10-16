defmodule MiniBazarWeb.PageLive do
  use MiniBazarWeb, :live_view

  alias MiniBazar.CRM.Subscriber
  alias MiniBazar.CRM

  alias MiniBazar.PageLivePubsub

  @impl true
  def mount(_params, _session, socket) do
  changeset = Subscriber.changeset( %Subscriber{}, %{} )
    {:ok, assign(socket, query: "", results: %{}, changeset: changeset)}
  end

  @impl true
  def handle_event("hide_shopcart", %{}, socket) do

    {:noreply, IO.inspect(socket) }
  end


  def handle_event("display_shopcart", %{}, socket) do
    PageLivePubsub.notify_live_view("shopcart", {__MODULE__, [:display_shopcard, true], []})
    {:noreply, IO.inspect(socket) }
  end

  @impl true
  def handle_event("validate", %{"subscriber" => query}, socket) do
    # check email not exists in subscribers
    IO.inspect(socket, label: "Socket")
    IO.inspect(query, label: "QRY")

    {:noreply, socket}
  end

  @impl true
  def handle_event("register", %{"subscriber" => subscriber_params}, socket) do
    IO.inspect(subscriber_params, label: "Subscribe email")

    CRM.create_subscriber(subscriber_params)
    |> case do
      {:error, changeset} ->
        IO.inspect changeset
        {:noreply, assign(socket, changeset: changeset)}

      {:ok, subscriber} ->
        IO.inspect("Usuario creado exitosamente")
        {:noreply, socket}
    end
  end

end
