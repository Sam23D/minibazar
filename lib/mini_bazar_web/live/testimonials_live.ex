defmodule MiniBazarWeb.TestimonialsLive do
  use MiniBazarWeb, :live_view


  @impl true
  def mount(_params, _session, socket) do

    {:ok, assign(socket, query: "")}
  end

end
