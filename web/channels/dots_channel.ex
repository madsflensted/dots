defmodule Dots.DotsChannel do
  use Phoenix.Channel

  def join("dots:updates", _auth_msg, socket) do
    :random.seed(:erlang.now())
    {:ok, %{"id" => random_id, "color" => random_color}, socket}
  end

  def handle_in(msg, payload, socket) do
    broadcast! socket, msg, payload
    {:noreply, socket}
  end

  defp random_color() do
    %{
      "red" => :random.uniform(255),
      "green" => :random.uniform(255),
      "blue" => :random.uniform(255) 
    }
  end

  defp random_id() do
    :random.uniform(100_000)
  end

end
