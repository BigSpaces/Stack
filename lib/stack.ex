defmodule Stack do
  @moduledoc """
   Documentation for `Stack`.
  """
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def push(pid, element) do
    GenServer.call(pid, {:push_element, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop_element)
  end

  @impl true
  def init(opts) do
    {:ok, opts}
  end

  # @impl true
  # def handle_

  @impl true
  def handle_call({:push_element, element}, _from, state) do
    {:reply, [element | state], [element | state]}
  end

  @impl true
  def handle_call(:pop_element, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_call(:pop_element, _from, state) do
    {:reply, hd(state), tl(state)}
  end
end
