defmodule Dots.DotsChannel do
  use Phoenix.Channel

  def join("dots:updates", _auth_msg, socket) do
    {:ok, socket}
  end

  def handle_in(msg, payload, socket) do
    broadcast! socket, msg, payload
    {:noreply, socket}
  end
end
