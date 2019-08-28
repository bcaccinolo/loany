defmodule Loany.Repo.Migrations.AddRequestsTable do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :amount, :integer

      timestamps()
    end
  end
end
