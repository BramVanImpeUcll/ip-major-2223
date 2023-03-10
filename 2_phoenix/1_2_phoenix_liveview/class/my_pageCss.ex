defmodule Deel1Web.MyPageCss do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tik)

    { :ok, assign(socket, hartslag_teller: 0, toets: " ... ")}
  end

  def render(assigns) do

    ~H"""
    <head>
    <style>
  .button {
    display: inline-block;
    padding: 15px 25px;
    font-size: 12px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    outline: none;
    color: #fff;
    background-color: #4CAF50;
    border: none;
    border-radius: 15px;
    box-shadow: 0 9px #999;
  }

  .button:hover {background-color: #3e8e41}

  .button:active {
    background-color: #3e8e41;
    box-shadow: 0 5px #666;
      transform: translateY(4px);
  }
  </style>
  </head>

  <body>

  <h2>Animated Button - "Pressed Effect"</h2>

  <button class="button" phx-click="inc" phx-value-myvar1={@hartslag_teller}>
    Klik mij!

  </button>

    <h1> Ik leef nog: <%= @hartslag_teller %> </h1>

  </body>
  """
  end

  def handle_event("key_pressed", %{ "key" => key }, socket) do
    {:noreply, assign(socket, toets: key)}
  end

  def handle_event("inc", %{"myvar1" => v}, socket) do
    IO.puts(v)
    {:noreply, socket}

  end

  def handle_info(:tik, socket) do
    h = socket.assigns.hartslag_teller
    socket = assign(socket, hartslag_teller: h + 1)
    {:noreply, socket}
    #{:noreply, update(socket, :hartslag_teller, &(&1 + 1))}
  end

end
