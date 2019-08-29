defmodule LoanyWeb.LoanRequestsController do
  use LoanyWeb, :controller

  alias Loany.LoanRequest

  def index(conn, _params) do

    changeset = LoanRequest.changeset(%LoanRequest{})

    # changeset = LoanRequest.changeset(Loany.Repo.get(LoanRequest, 3))
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"loan_request" => loan_request}) do
    changeset = LoanRequest.changeset(%LoanRequest{}, loan_request)
    %{amount: amount} = changeset.changes

    {:ok, new_request} = Loany.Repo.insert(changeset)

    case Loany.Scoring.evaluate(amount) do
      {:ok, rate} -> render(conn, "accepted.html", loan_request: new_request)
      {:error, _} -> render(conn, "rejected.html", loan_request: new_request)
    end

  end

  def accepted(conn, %{"id" => id}) do
    request = Loany.Repo.get(LoanRequest, id)
    render(conn, "accepted.html", request: request)
  end

  def rejected(conn, %{"id" => id}) do
    request = Loany.Repo.get(LoanRequest, id)
    render(conn, "rejected.html", request: request)
  end
end
