#!/usr/bin/env bash
set -e

echo "Deleting existing postgres.dump.sql..."
rm -f ./data/postgres.dump.sql

read -p 'Enter Postgres URI: ' pg_uri

echo "Downloading postgres dump, saving data/postgres.dump.sql..."
pg_dump --attribute-inserts --data-only -d $pg_uri > ./data/postgres.dump.sql
