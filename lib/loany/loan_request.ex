defmodule Loany.LoanRequest do
  use Ecto.Schema
  import Ecto.Changeset
  # alias Loany.LoanRequest

  schema "loan_requests" do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :amount, :integer

    field :accepted, :boolean
    field :rate, :float

    timestamps()
  end

  def form_changeset(%Loany.LoanRequest{} = request, attrs \\ %{}) do
    request
    |> cast(attrs, [:name, :email, :phone, :amount])
    |> validate_required([:name, :email, :phone, :amount])
    |> validate_format(:email, ~r/@/)
    |> validate_format(:phone, ~r/^[[:digit:]\.\s]+$/)
    |> validate_number(:amount, greater_than: 0)
    |> unique_constraint(:email)
  end

  def scoring_changeset(request, attrs \\ %{}) do
    request
    |> cast(attrs, [:accepted, :rate])
  end

  def changeset_from_params_and_scoring(params) do
    changeset = form_changeset(%Loany.LoanRequest{}, params)

    case changeset.valid? do
      true -> update_changeset_with_scoring(changeset)
      false -> changeset
    end
  end

  def update_changeset_with_scoring(changeset) do
    {:ok, amount} = fetch_change(changeset, :amount)

    params =
      case Loany.Scoring.evaluate(amount) do
        {:ok, rate} -> %{accepted: true, rate: rate}
        {:error, _} -> %{accepted: false}
      end

    scoring_changeset(changeset, params)
  end
end
