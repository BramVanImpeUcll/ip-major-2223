defmodule Deel1Web.MyPage4 do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tik)

    { :ok, assign(socket, hartslag_teller: 0)}
  end

  def render(assigns) do

    ~H"""
    <h1> Ik leef nog: <%= @hartslag_teller %> </h1>


    <p> <%= inspect(assigns) %> </p>

    """
  end

  def handle_info(:tik, socket) do
    h = socket.assigns.hartslag_teller
    socket = assign(socket, hartslag_teller: h + 1)
    {:noreply, socket}
    #{:noreply, update(socket, :hartslag_teller, &(&1 + 1))}
  end

end
