defmodule Loany.ScoringTest do
  use ExUnit.Case

  describe "the amount is lower than preceding highest loan" do
    initial_state  = [10000, 5000, 1000]
    Loany.AmountsAgent.start_link(initial_state)

    assert {:error, :loan_to_low} == Loany.Scoring.evaluate(5000)
  end

  describe "the amount is higher than preceding highest loan" do
    initial_state  = [10000, 5000, 1000]
    Loany.AmountsAgent.start_link(initial_state)

    assert {:ok, :loan_accepted} == Loany.Scoring.evaluate(50000)
  end
end
