defmodule StackTest do
  use ExUnit.Case, async: true
  alias Stack.Worker

  test "allows pushing and popping from a queue" do
    Worker.push(1)
    assert Worker.pop() == 1
  end

  # Jose to the rescue
  # https://groups.google.com/d/msg/elixir-lang-talk/dHvu2wge00A/-h0z55zyCwAJ
  @tag :capture_log
  test "exits if empty stack is pop'd" do
    Worker.reset!
    catch_exit(Worker.pop())
  end

  @tag :capture_log
  test "gracefully recovers from issues, preserving the stack" do
    Worker.push(1)
    Worker.push(2)
    catch_error(Worker.push(:StackErrorDawg))

    assert Worker.pop() == 2
  end
end
