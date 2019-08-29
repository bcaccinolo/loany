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

  def form_changeset(request, attrs \\ %{}) do
    request
    |> cast(attrs, [:name, :email, :phone, :amount])
  end

  def scoring_changeset(request, attrs \\ %{}) do
    request
    |> cast(attrs, [:accepted, :rate])
  end
end
