#!/usr/bin/env bash
set -e

echo "Removing data/sqlite.db..."
rm -f data/sqlite.result.db

./sqlite.create_tables.sh
