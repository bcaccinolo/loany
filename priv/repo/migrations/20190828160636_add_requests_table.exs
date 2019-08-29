defmodule Loany.Repo.Migrations.AddLoanRequestsTable do
  use Ecto.Migration

  def change do
    create table(:loan_requests) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :amount, :integer

      timestamps()
    end
  end
end
