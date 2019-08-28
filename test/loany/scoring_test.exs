defmodule Loany.ScoringTest do
  use ExUnit.Case

  setup do
    initial_state = [10_000, 5_000, 1_000]
    {:ok, pid} = Loany.AmountsAgent.start_link(initial_state)
    {:ok, pid: pid}
  end

  describe "evaluate/1" do
    test "amount is lower than preceding highest loan" do
      assert {:error, :loan_to_low} == Loany.Scoring.evaluate(5_000)
    end

    test "amount is the highest amount and a prime number" do
      assert {:ok, 9.99} == Loany.Scoring.evaluate(59_981)
    end

    test "amount is the highest amount and NOT a prime number" do
      {:ok, rate} = Loany.Scoring.evaluate(60_000)
      assert (rate >= 4) && (rate <= 12)
    end
  end

  describe "is_prime_number/1" do
    test "the amount is a prime number" do
      assert Loany.Scoring.is_prime_number(59_957)
    end

    test "the amount is NOT a prime number" do
      refute Loany.Scoring.is_prime_number(60_000)
    end
  end
end
