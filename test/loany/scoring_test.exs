defmodule Loany.ScoringTest do
  use ExUnit.Case

  describe "evaluate/1" do
    setup do
      Loany.AmountsAgent.init_state([10_000, 5_000, 1_000])
      :ok
    end

    test "amount is lower than preceding highest loan" do
      assert {:error, :loan_to_low} == Loany.Scoring.evaluate(5_000)
    end

    test "amount is the highest amount and a prime number" do
      amount = 59_981
      assert {:ok, 9.99} == Loany.Scoring.evaluate(amount)
      assert amount == Loany.AmountsAgent.get_highest_amount()
    end

    test "amount is the highest amount and NOT a prime number" do
      amount = 60_000
      {:ok, rate} = Loany.Scoring.evaluate(amount)
      assert rate >= 4 && rate <= 12
      assert amount == Loany.AmountsAgent.get_highest_amount()
    end
  end

  describe "is_prime_number/1" do
    test "the amount is a prime number" do
      [2, 3, 5, 7, 11, 13, 17, 59_957]
      |> Enum.each(fn x -> assert Loany.Scoring.is_prime_number(x) end)
    end

    test "the amount is NOT a prime number" do
      refute Loany.Scoring.is_prime_number(60_000)
    end
  end
end
