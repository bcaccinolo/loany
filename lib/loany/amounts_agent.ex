defmodule Loany.AmountsAgent do
    use Agent

    def start_link(initial_state \\ []) do
      Agent.start_link(fn -> initial_state end, name: __MODULE__)
    end

    def add_amount(amount) do
        Agent.update(__MODULE__, fn state -> ([amount | state]) end)
    end

    def get_highest_amount() do
        Agent.get(__MODULE__, fn [highest | _] -> highest end)
    end
end
