defmodule MiniBazarWeb.MainNavBarLive do
  use MiniBazarWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do

    {:ok, assign(socket, display_shopcart: true )}
  end

  @impl true
  def handle_event("hide_shopcart", %{}, socket), do:
    {:noreply, assign(IO.inspect(socket), display_shopcart: false )}


  def handle_event("display_shopcart", %{}, socket), do:
    {:noreply, assign(IO.inspect(socket), display_shopcart: true )}

end
