defmodule Deel1Web.MyPage5 do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tik)

    { :ok, assign(socket, hartslag_teller: 0, toets: " ... ")}
  end

  def render(assigns) do

    x = "7"

    ~H"""
    <div class = "test" phx-window-keyup="key_pressed"> </div>

    <button phx-click="inc" phx-value-myvar1={@hartslag_teller} phx-value-myvar2={x}>
    Klik mij!
    </button>

    <h1> Ik leef nog: <%= @hartslag_teller %> </h1>

    <h2> <%= @toets %> </h2>
    <p> <%= inspect(assigns) %> </p>

    """
  end

  def handle_event("key_pressed", %{ "key" => key }, socket) do
    {:noreply, assign(socket, toets: key)}
  end

  def handle_event("inc", %{"myvar1" => v, "myvar2" => w}, socket) do
    IO.puts(v)
    IO.puts(w)
    {:noreply, socket}

  end

  def handle_info(:tik, socket) do
    h = socket.assigns.hartslag_teller
    socket = assign(socket, hartslag_teller: h + 1)
    {:noreply, socket}
    #{:noreply, update(socket, :hartslag_teller, &(&1 + 1))}
  end

end
