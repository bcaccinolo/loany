# Loany

## todo

- ✅create the Amount Agent
- ✅scoring with highest amount
- ✅scoring with prime number calculation

- Ecto
- ✅add migrations
- ✅add models

- ✅route : GET /requests/id/accepted - basic page showing the data
- ✅route : GET /requests/id/rejected - basic page showing the data

- ✅creaion of basic form
- ✅convert Request in LoanRequest
- ✅persist the data

- 🔥have the test using the service

- validate the data

- get amount from agent when agent list is empty should return 0

## launch the db

docker run --name pg_loany -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres:10

docker inspect pg_loany | ack IPAddress

mix ecto.create

## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
