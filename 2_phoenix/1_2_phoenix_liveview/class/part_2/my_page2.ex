defmodule Deel2Web.MyPage2 do
  alias Inspect.Deel2.Accounts
  alias Phoenix.LiveView
  alias Deel2.Accounts
  use LiveView

  def mount( _params , session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])
    #if connected?(socket), do: IO.puts(inspect(session))
    {:ok, assign(socket, sessie: inspect(session), user: user.email)}
  end

  def render(assigns) do
    ~H"""

    <pre> Deze web page is persoonlijk... </pre>



    <p> GEBRUIKER IS : <%= @user %> </p>

    ____________________________________________

    <p> <%= inspect(assigns) %> </p>


    """
  end

end
