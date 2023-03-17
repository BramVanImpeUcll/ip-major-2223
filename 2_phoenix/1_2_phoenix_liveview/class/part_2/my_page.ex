defmodule Deel2Web.MyPage do
  alias Inspect.Deel2.Accounts
  alias Phoenix.LiveView
  alias Phoenix.PubSub
  alias Deel2.Accounts
  use LiveView

  def mount( _params , session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])
    #if connected?(socket), do: IO.puts(inspect(session))
    PubSub.subscribe(Deel2.PubSub, "les van vandaag")
    PubSub.subscribe(:hi, "roddelkrant")
    {:ok, assign(socket, sessie: inspect(session), user: user.email, msg1: "...", msg2: "!!!")}
  end

  def render(assigns) do
    ~H"""



    <p> GEBRUIKER IS : <%= @user %> </p>


    <pre> <%= @msg1 %> </pre>

    <pre> <%= @msg2 %> </pre>


    ##########################################################################

    <p> </p> <p> <%= inspect(assigns) %> </p>


    """
  end

  def handle_info({:from_pub_sub, msg}, socket) do
    {:noreply, assign(socket, msg1: inspect(msg))}
  end

  def handle_info(msg, socket) do
    {:noreply, assign(socket, msg2: inspect(msg))}
  end

end
