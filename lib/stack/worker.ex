defmodule Stack.Worker do
  use GenServer
  alias Stack.Stash

  def start_link(state) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(:StackErrorDawg), do: raise "Purposefully Raising Error"
  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  def reset! do
    GenServer.cast(__MODULE__, :reset)
  end

  def init(stash_pid) do
    stack = Stash.get(stash_pid)
    {:ok, {stack, stash_pid}}
  end

  def handle_call(:pop, _from, {stack, stash_pid}) do
    [head | tail] = stack
    {:reply, head, {tail, stash_pid}}
  end

  def handle_cast({:push, item}, {stack, stash_pid}) do
    {:noreply, {[item | stack], stash_pid}}
  end

  def handle_cast(:reset, {_, stash_pid}) do
    Stash.set(stash_pid, [])
  end

  def terminate(_reason, {stack, stash_pid}) do
    Stash.set(stash_pid, stack)
  end
end
