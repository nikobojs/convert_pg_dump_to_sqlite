#!/usr/bin/env bash
set -e

echo "Importing data into database..."
sqlite3 data/sqlite.result.db < data/sqlite.converted.dump.sql 