defmodule Stack.Stash do
  use GenServer

  def start_link(state) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, state)
  end

  def set(pid, value) do
    GenServer.cast(pid, {:set, value})
  end

  def get(pid) do
    GenServer.call(pid, :get)
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:set, new_state}, _current_state) do
    {:noreply, new_state}
  end
end
