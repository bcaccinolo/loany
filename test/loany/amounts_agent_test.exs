defmodule Loany.AmountsAgentTest do
    use ExUnit.Case

        test "first amount" do
            Loany.AmountsAgent.start_link()
            assert :ok == Loany.AmountsAgent.add_amount(30_000)
            assert Loany.AmountsAgent.get_highest_amount() == 30000
        end

        test "adding to a list" do
            initial_state  = [10000, 5000, 1000]
            Loany.AmountsAgent.start_link(initial_state)
            assert :ok == Loany.AmountsAgent.add_amount(30_000)
            assert Loany.AmountsAgent.get_highest_amount() == 30000
        end

end
