defmodule LoanyWeb.RequestsController do
  use LoanyWeb, :controller

  def index(conn, _params) do
    changeset = Loany.Request.changeset(%Loany.Request{})
    # changeset = Loany.Request.changeset(Loany.Repo.get(Loany.Request, 3))
    render conn, "index.html", changeset: changeset
  end

  def create(conn, %{"request" => request}) do

    IO.puts("passing there !!!")
    IO.inspect(request)

    changeset = Loany.Request.changeset(%Loany.Request{}, request)
    render conn, "index.html", changeset: changeset
  end

  def accepted(conn, %{"id" => id}) do
    request = Loany.Repo.get(Loany.Request, id)
    render(conn, "accepted.html", request: request)
  end

  def rejected(conn, %{"id" => id}) do
    request = Loany.Repo.get(Loany.Request, id)
    render(conn, "rejected.html", request: request)
  end
end
