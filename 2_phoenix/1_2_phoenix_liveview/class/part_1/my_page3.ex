defmodule Deel1Web.MyPage3 do
  use Phoenix.LiveView

  def mount(_params, _session, socket), do: { :ok, assign(socket, message: "ik doe ook mee", boodschap: 99)}

  def render(assigns) do

    b = "<b>"
    n = "</b>"
    t = "ook testing"
    f = self()
    url = "https://www.ucll.be"

    ~H"""
    <h1> --------- Hello World ------------- </h1>

    <p> <%= b %>  <%= t %> <%= @message %> <%= n %> <%= @boodschap %> </p>

    <a href="https://codestool.coding-gnome.com/courses/elixir-for-programmers-2">Ontdek Elixir en Phoenix LiveView</a>
    <p> </p>
    <a href={url}>Visit UCLL</a>

    <p> <%= Phoenix.HTML.raw(b) %>  testing
    <%= Phoenix.HTML.raw(n) %> <%= inspect(f)  %> </p>

    <p> <%= inspect(assigns) %> </p>



    """
  end

end
