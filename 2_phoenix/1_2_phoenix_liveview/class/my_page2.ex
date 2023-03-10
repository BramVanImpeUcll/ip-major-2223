defmodule Deel1Web.MyPage2 do
  use Phoenix.LiveView

  def mount(_params, _session, socket), do: { :ok, socket}

  def render(assigns) do

    b = "<b>"
    n = "</b>"
    t = "ook testing"
    f = self()

    ~H"""
    <h1> --------- Hello World ------------- </h1>

    <p> <%= b %>  <%= t %>   <%= n %> "123" </p>

    <p> <%= Phoenix.HTML.raw(b) %>  testing
    <%= Phoenix.HTML.raw(n) %> <%= inspect(f)  %> </p>

    <p> <%= inspect(assigns) %> </p>



    """
  end

end
