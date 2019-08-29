defmodule Loany.AmountsAgent do
  use Agent

  def start_link(initial_state \\ [0]) do
    IO.puts("Launching the Agent 🚨")
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def add_amount(amount) do
    IO.puts("adding #{amount}")
    Agent.update(__MODULE__, fn state -> [amount | state] end)
  end

  def get_highest_amount() do
    Agent.get(__MODULE__, fn
      [highest | _] -> highest
      _ -> 0
    end)
  end

  def empty_state() do
    Agent.update(__MODULE__, fn _ -> [0] end)
  end

  def init_state(list) do
    list |> Enum.sort() |> Enum.reverse() |> (&Agent.update(__MODULE__, fn _ -> &1 end)).()
  end

  def disp_state() do
    Agent.get(__MODULE__, fn state ->
      IO.puts("the state")
      IO.inspect(state)
    end)
  end
end
