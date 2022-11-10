defmodule StackTest do
  use ExUnit.Case
  # doctest Stack

  describe "start_link/1" do
    test "with no configuration" do
      # assert {:ok, pid} = Stack.start_link() <= The STEPHAN potato
      assert {:ok, _pid} = Stack.start_link([])
    end

    test "with a default state" do
      assert {:ok, pid} = Stack.start_link([1])
      assert Stack.pop(pid) == 1
    end
  end

  describe "push/2" do
    test "an element onto an empty stack" do
      assert {:ok, pid} = Stack.start_link([])
      assert Stack.push(pid, 42) == [42]
    end

    test "an element onto a stack with one element" do
      assert {:ok, pid} = Stack.start_link([42])
      assert Stack.push(pid, 24) == [24, 42]
    end

    test "an element onto a stack with multiple elements" do
      assert {:ok, pid} = Stack.start_link([42, 24, 12])
      assert Stack.push(pid, 22) == [22, 42, 24, 12]
    end
  end

  describe "pop/1" do
    test "an empty stack" do
      assert {:ok, pid} = Stack.start_link([])
      assert Stack.pop(pid) == nil
    end

    test "a stack with one element" do
      assert {:ok, pid} = Stack.start_link([42])
      assert Stack.pop(pid) == 42
    end

    test "a stack with multiple elements" do
      assert {:ok, pid} = Stack.start_link([42, 24, 12])
      assert Stack.pop(pid) == 42
      assert Stack.pop(pid) == 24
    end
  end
end
