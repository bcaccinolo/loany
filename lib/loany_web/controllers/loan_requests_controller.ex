defmodule LoanyWeb.LoanRequestsController do
  use LoanyWeb, :controller

  alias Loany.LoanRequest

  def index(conn, _params) do
    changeset = LoanRequest.form_changeset(%LoanRequest{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"loan_request" => loan_request}) do
    changeset = LoanRequest.form_changeset(%LoanRequest{}, loan_request)
    %{amount: amount} = changeset.changes

    result = Loany.Scoring.evaluate(amount)

    scoring_updates =
      case result do
        {:ok, rate} -> %{accepted: true, rate: rate}
        {:error, _} -> %{accepted: false}
      end

    changeset2 = LoanRequest.scoring_changeset(changeset, scoring_updates)

    {:ok, new_request} = Loany.Repo.insert(changeset2)

    template =
      case new_request.accepted do
        true -> "accepted.html"
        false -> "rejected.html"
      end

    render(conn, template, loan_request: new_request)
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
