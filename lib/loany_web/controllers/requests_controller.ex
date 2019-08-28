defmodule LoanyWeb.RequestsController do
  use LoanyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
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
