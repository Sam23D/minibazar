defmodule MiniBazarWeb.LiveComponents.SubscribeSection do
  use MiniBazarWeb, :live_view
  alias MiniBazar.CRM.Subscriber
  alias MiniBazar.CRM

  # LiveView

  def mount(_params, _session, socket) do
    changeset = Subscriber.changeset( %Subscriber{}, %{} )
    socket = assign(socket, changeset: changeset)
    {:ok, socket, layout: {MiniBazarWeb.LayoutView, "live.html"}}
  end

  @impl true
  def handle_event("validate", %{"subscriber" => query}, socket) do
    # check email not exists in subscribers
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

  def render(assigns)do
    IO.inspect(assigns.socket, label: "Subscribe Section assigns")
    ~H"""
    <!-- start SubscribeSection -->
      <div id="subscribe" class="container flex flex-col justify-center items-center mx-auto my-8 py-10">
          <div style="background-image: url(https://images.unsplash.com/photo-1538582709238-0a503bd5ae04?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80)"
              class="max-w-5xl bg-gray-300 h-64 w-full rounded-lg shadow-md bg-cover bg-center">
          </div>

          <!-- Card -->
          <div class="bg-white -mt-24 shadow-md rounded-lg overflow-hidden">
              <div class="items-center justify-between py-10 px-5 bg-white shadow-2xl rounded-lg mx-auto text-center">
                  <div class="px-2 -mt-6">
                      <div class="text-center">
                          <h1 class="font-normal text-3xl text-grey-800 font-medium leading-loose my-3 w-full">Subscribe & get a coupon</h1>
                          <div class="w-full text-center">
                              <.form class="flex flex-col gap-y-3" let={f} for={@changeset} phx-change="validate", phx_submit="register"] >
                                  <%= label f, :Name, class: "text-left text-gray-400 " %>
                                  <%= text_input f, :name, placeholder: "Dejanos tu nombre...", class: "flex-1 appearance-none rounded shadow p-3 text-grey-dark mr-2 focus:outline-none" %>
                                  <%= error_tag f, :name %>
                                  <%= label f, :Email, class: "text-left text-gray-400" %>
                                  <%= text_input f, :email, placeholder: "...y un correo electronico.", class: "flex-1 appearance-none rounded shadow p-3 text-grey-dark mr-2 focus:outline-none" %>
                                  <%= error_tag f, :email %>
                                  <%= submit "Recibir cupon y aceptar terminos", class: "bg-red-400 text-white text-base font-semibold rounded-md shadow-md hover:bg-indigo-600 p-3" %>
                              </.form>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- end Card -->
      </div>
      <!-- end SubscribeSection -->


    """
  end

end
