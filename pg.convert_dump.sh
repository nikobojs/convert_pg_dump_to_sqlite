#!/usr/bin/env bash
set -e

# delete existing file if exists
echo "Deleting existing sqlite.converted.dump.sql..."
rm -f data/sqlite.converted.dump.sql

# translate the pg_dump to sqlite sql ("it works on my computer")
echo "Converting the postgres dump..."
sed -e "s/ public\./ /g" data/postgres.dump.sql | # replace " public." with " "
sed -e "s/true, /\'t\', /g" |              # replace "true" with "'t'"
sed -e "s/false, /\'f\', /g" |             # replace "false" with "'f'"
sed -e "s/OVERRIDING SYSTEM VALUE //g" |   # remove thing i dont know what is (sqlite doesnt either)
sed -e '/^$/d' |                           # remove empty lines 
sed -e '/^SET/d' |                         # remove all lines that starts with "SET" (seen in top of pg_dumps)
sed -e '/pg_/d' |                          # remove all lines that contains "pg_"
sed -e '1s/^/BEGIN;\n/' |                  # add BEGIN in the top (makes imports much faster) 
sed -e '$ a\END;' > data/sqlite.converted.dump.sql # add END in the bottom (required when BEGIN is the top)
