defmodule Loany.Scoring do

  def evaluate(amount) do
    evaluate_higher_than_previous(amount)
  end

  def evaluate_higher_than_previous(amount) do
    cond do
      amount > Loany.AmountsAgent.get_highest_amount() -> {:ok, :loan_accepted}
      true -> {:error, :loan_to_low}
    end

  end
end
