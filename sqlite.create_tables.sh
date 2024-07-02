#!/usr/bin/env bash
set -e

echo "Creating new tables..."
cat sql/tables.sql | sqlite3 data/sqlite.result.db
