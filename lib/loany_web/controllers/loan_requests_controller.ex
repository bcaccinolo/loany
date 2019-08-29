defmodule LoanyWeb.LoanRequestsController do
  use LoanyWeb, :controller

  alias Loany.LoanRequest

  def index(conn, _params) do

    changeset = LoanRequest.changeset(%LoanRequest{})

    # changeset = LoanRequest.changeset(Loany.Repo.get(LoanRequest, 3))
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"request" => request}) do
    IO.puts("passing there !!!")
    IO.inspect(request)

    changeset = LoanRequest.changeset(%LoanRequest{}, request)
    IO.puts("is it valid? ")
    IO.inspect(changeset.valid?)
    Loany.Repo.insert(changeset)

    # result = Loany.Scoring.evaluate(changeset.amount)
    # IO.puts("Scoring result #{result}")

    render(conn, "index.html", changeset: changeset)
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
