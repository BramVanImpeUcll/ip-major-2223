defmodule Deel2.MyServer2 do
  use GenServer

def start_link(args) do
  {:ok, pid} = GenServer.start_link(__MODULE__, args)
  Process.register(pid, :ikke)
  {:ok, pid}
end

def get(server_pid), do: GenServer.call(server_pid, :get)

def inc(server_pid), do: GenServer.cast(server_pid, :inc)

def reset(server_pid), do: GenServer.cast(server_pid, :reset)

def kill(server_pid), do: GenServer.cast(server_pid, :kill)

########################
#  Callback functions  #
########################

def init(args), do: {:ok, args}

def handle_call(:get, _from, state), do: {:reply, state, state}

def handle_cast(:inc, state) do
  Phoenix.PubSub.broadcast(:hi, "roddelkrant", inspect(state) <> " + 1")
  {:noreply, state + 1 }
end

def handle_cast(:kill, _state), do: exit(:kaboom)

def handle_cast(:reset, _state), do: {:noreply, 0 }


end
