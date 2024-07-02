#!/usr/bin/env bash
set -e

./sqlite.reset_db.sh
./pg.download_dump.sh
./pg.convert_dump.sh
./sqlite.import.sql.sh
