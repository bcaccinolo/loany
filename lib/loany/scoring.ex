defmodule Loany.Scoring do
  def evaluate(amount) do
    with  {:ok} <- evaluate_higher_than_previous(amount),
          {:ok} <- is_prime_number(amount)
      do
        {:ok, :loan_accepted}
      else
        {:error, response} -> {:error, response}
    end
  end

  def evaluate_higher_than_previous(amount) do
    cond do
      amount > Loany.AmountsAgent.get_highest_amount() -> {:ok}
      true -> {:error, :loan_to_low}
    end
  end

  def is_prime_number(amount) do
    cond do
      is_prime_number(amount, amount - 1) -> {:ok}
      true -> {:error, :not_a_prime_number}
    end
  end

  defp is_prime_number(x, _) when x <= 1, do: false
  defp is_prime_number(_, 1), do: true
  defp is_prime_number(x, i) when rem(x, i) == 0, do: false
  defp is_prime_number(x, i), do: is_prime_number(x, i - 1)
end
