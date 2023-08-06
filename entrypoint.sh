#!/bin/sh

already_did_init="/data/database.db"

if [ ! -e "$already_did_init" ]; then
    echo "Running database init"
    sqlite3 /data/database.db
fi

schema_not_changed_hash="ea53353fcafe419cc86e54163306d3005851a438"
is_schema_already_initialized="./already_did_schema"
schema_hash=$(shasum init_db.sql | cut -d ' ' -f 1)

# We check if the schema contents has changed, and if it has, we run the init_.sql
# file. We also check if the schema has already been initialized, and if it has, we
# don't run the init_db.sql file.
if [ ! -f "$is_schema_already_initialized" ] && [ "$schema_not_changed_hash" != "$schema_hash" ]; then
    echo "Running database init"
    sqlite3 /data/database.db < init_db.sql
    touch "$is_schema_already_initialized"
fi

python wsgi.py /data/database.db