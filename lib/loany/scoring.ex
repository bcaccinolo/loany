defmodule Loany.Scoring do

  def evaluate(amount) do
    with {:ok} <- is_accepted?(amount),
         {:ok, rate} <- get_rate(amount) do
      {:ok, rate}
    else
      {:error, reason} -> {:error, reason}
    end
  end

  def is_accepted?(amount) do
    if amount > highest_last_amount() do
      {:ok}
    else
      {:error, :loan_to_low}
    end
  end

  def highest_last_amount() do
    Loany.AmountsAgent.get_highest_amount()
  end

  def get_rate(amount) do
    if is_prime_number(amount) do
      {:ok, 9.99}
    else
      {:ok, :rand.uniform(9) + 3}
    end
  end

  def is_prime_number(amount), do: is_prime_number(amount, amount - 1)

  defp is_prime_number(x, _) when x <= 1, do: false
  defp is_prime_number(_, 1), do: true
  defp is_prime_number(x, i) when rem(x, i) == 0, do: false
  defp is_prime_number(x, i), do: is_prime_number(x, i - 1)
end
