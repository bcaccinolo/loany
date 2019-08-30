defmodule LoanyWeb.LoanRequestsController do
  use LoanyWeb, :controller

  alias Loany.LoanRequest

  def index(conn, _params) do
    changeset = LoanRequest.form_changeset(%LoanRequest{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"loan_request" => loan_request_params}) do
    changeset = LoanRequest.changeset_from_params_and_scoring(loan_request_params)

    case Loany.Repo.insert(changeset) do
      {:ok, loan_request} -> render_loan_status_page(conn, loan_request)
      {:error, changeset} -> render(conn, "index.html", changeset: changeset)
    end
  end

  def render_loan_status_page(conn, loan_request) do
    action = if loan_request.accepted, do: :accepted, else: :rejected
    redirect(conn, to: Routes.loan_requests_path(conn, action, loan_request.id))
  end

  def accepted(conn, %{"id" => id}) do
    loan_request = Loany.Repo.get(LoanRequest, id)
    render(conn, "accepted.html", loan_request: loan_request)
  end

  def rejected(conn, %{"id" => id}) do
    loan_request = Loany.Repo.get(LoanRequest, id)
    render(conn, "rejected.html", loan_request: loan_request)
  end
end
