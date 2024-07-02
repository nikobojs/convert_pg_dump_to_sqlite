# Convert Postgres dump to SQLite

This repo contains a bunch of bash scripts that makes the process easy. It's simple and meant to be modified to your needs.

The bash scripts are tested on Debian 12 with Postgres 15.5 and SQLite 3.40.

Contributions are welcome.


## How to use

#### Make sure you have:

- A postgres URI you want to dump and convert to sqlite
- `pg_dump`
- `sqlite3`

#### Create sqlite schema

Create `sql/tables.sql` and insert your `CREATE TABLE` statements for sqlite.

#### Run it

Run `./run_all.sh` to do all steps:

- Create a new sqlite db `data/sqlite.result.db`
- Create tables in the sqlite db (runs `sql/tables.sql`)
- Take pg_dump into `data/postgres.dump.sql`
- Convert the pg_dump (which is sql) into sqlite sql
- Import the converted sqlite dump into `data/sqlite.result.db`
