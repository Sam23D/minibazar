defmodule MiniBazar.PageLivePubsub do
  @topic inspect(__MODULE__)

  @doc "subscribe for all cards"
  def subscribe_live_view do
    Phoenix.PubSub.subscribe(MiniBazar.PubSub, topic(), link: true)
  end

  @doc "subscribe for specific card"
  def subscribe_live_view(card_id) do
    Phoenix.PubSub.subscribe(MiniBazar.PubSub, topic(card_id), link: true)
  end

  @doc "notify for all cards"
  def notify_live_view(message) do
    Phoenix.PubSub.broadcast(MiniBazar.PubSub, topic(), message)
  end

  @doc "notify for specific card"
  def notify_live_view(card_id, message) do
    Phoenix.PubSub.broadcast(MiniBazar.PubSub, topic(card_id), message)
  end

  defp topic, do: @topic
  defp topic(card_id), do: topic() <> to_string(card_id)
end
