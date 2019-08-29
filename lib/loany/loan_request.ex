defmodule Loany.LoanRequest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Loany.LoanRequest

  schema "requests" do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :amount, :integer

    timestamps()
  end

  @doc false
  def changeset(request, attrs \\ %{}) do
    request
    |> cast(attrs, [:name, :amount])
  end
end