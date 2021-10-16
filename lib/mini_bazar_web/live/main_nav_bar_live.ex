defmodule MiniBazarWeb.MainNavBarLive do
  use MiniBazarWeb, :live_view

  alias MiniBazar.PageLivePubsub

  @impl true
  def mount(_params, _session, socket) do
    PageLivePubsub.subscribe_live_view( "shopcart" )
    {:ok, assign(socket, display_shopcart: true )}
  end

  # handles PubSub messages
  def handle_info({requesting_module, [:display_shopcard, value], []}, socket) do
    {:noreply, assign(IO.inspect(socket), display_sthxhopcart: value)}
  end

  @impl true
  def handle_event("hide_shopcart", %{}, socket), do:
    {:noreply, assign(IO.inspect(socket), display_shopcart: false )}


  def handle_event("display_shopcart", %{}, socket), do:
    {:noreply, assign(IO.inspect(socket), display_shopcart: true )}

end
