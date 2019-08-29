defmodule Loany.AmountsAgentTest do
  use ExUnit.Case

  describe "state is empty" do
    setup :empty_state

    test "first amount" do
      assert :ok == Loany.AmountsAgent.add_amount(30_000)
      assert Loany.AmountsAgent.get_highest_amount() == 30000
    end

    test "fetch the highest amount after launch" do
      assert Loany.AmountsAgent.get_highest_amount() == 0
    end
  end

  describe "state contains some amounts" do
    setup :state_with_amounts

    test "addition of an amount" do
      assert :ok == Loany.AmountsAgent.add_amount(30_000)
      assert Loany.AmountsAgent.get_highest_amount() == 30000
    end
  end

  defp state_with_amounts(_context) do
    Loany.AmountsAgent.init_state([10_000, 5_000, 1_000])
    :ok
  end

  defp empty_state(_context) do
    Loany.AmountsAgent.empty_state()
    :ok
  end
end
