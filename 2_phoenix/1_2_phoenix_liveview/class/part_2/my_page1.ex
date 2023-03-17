defmodule Deel2Web.MyPage1 do
  alias Phoenix.LiveView
  use LiveView

  def mount( params , session, socket) do
    #if connected?(socket), do: IO.puts(inspect(session))
    {:ok, assign(socket, sessie: inspect(session), param: inspect(params))}
  end

  def render(assigns) do
    ~H"""

    <pre> Deze web page is persoonlijk... </pre>

    <p><b> ASSIGNS : </b> <%= inspect(assigns) %> </p>

    <p><b> SESSION :  </b> <%= @sessie %> </p>

    <p><b> PARAMS : </b> <%= @param %> </p>

    """
  end

end
