# Loany

## todo

- create the Amount Agent
  - insert highest amount in the sorted list
  - get the highest amount (head)

## launch the db

docker run --name pg_loany_test -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres  -e POSTGRES_DB=loany_test  postgres

docker inspect pg_loany_test | ack IPAddress

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