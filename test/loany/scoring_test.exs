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
      assert {:ok, :loan_accepted} == Loany.Scoring.evaluate(59_981)
    end
  end

  describe "evaluate_higher_than_previous/1" do
    test "the amount is lower than preceding highest loan" do
      assert {:error, :loan_to_low} == Loany.Scoring.evaluate_higher_than_previous(5_000)
    end

    test "the amount is higher than preceding highest loan" do
      assert {:ok} == Loany.Scoring.evaluate_higher_than_previous(50_000)
    end
  end

  describe "is_prime_number/1" do
    test "the amount is a prime number" do
      assert {:ok} == Loany.Scoring.is_prime_number(59_957)
    end

    test "the amount is NOT a prime number" do
      assert {:error, :not_a_prime_number} == Loany.Scoring.is_prime_number(60_000)
    end
  end
end
