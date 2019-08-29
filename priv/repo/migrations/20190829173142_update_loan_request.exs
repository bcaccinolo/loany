defmodule Loany.Repo.Migrations.UpdateLoanRequest do
  use Ecto.Migration

  def change do
    alter table("loan_requests") do
      add :accepted, :boolean
      add :rate, :float
    end
  end
end
