Elements access service for MET API
=======================================

This module implements a service for reading metadata about MET API elements.

# Run

To be able to use the system, you will usually want to modify the
configuration files. For development purposes, you can instead create a file
`conf/development.conf` with the following entries:
```
db.elements.driver = org.postgresql.Driver
db.elements.url = "jdbc:postgresql://localhost:5432/elements"
db.elements.username = <your-user-name>
db.elements.password = ""
db.elements.logStatements = true
play.http.router = elements.Routes
mail.override.address = "<your-email>"
play.evolutions.db.authorization.autoApply=true
auth.active=false
```

## Tests

To run the tests, do: `activator test`. To run tests with coverage report,
use: `activator coverage test coverageReport`.

## Running with Mock

To run the application with mock database connections, do: `activator run`

## Running in Test Production

To run the application in test production, you will need a working database
for the system to interact with.

A simple approach, on Ubuntu, is to install a Postgres server on localhost,
set it up for local connections (listen_addresses = '*' in postgresql.conf),
set it to trust local connections (in pg_hba.conf), and then create a local
database elements with `createdb elements`.

Alternatively, you can point your url at a test instance of elemdb.

Once the database is set up, you can run test production using `activator testProd`.

If you are running against your own database on localhost, use:
`activator "testProd -Dplay.evolutions.db.elements.autoApply=true"` to evolve
the database first.
