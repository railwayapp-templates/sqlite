#!/bin/sh

already_did_init="/data/database.db"

if [ ! -e "$already_did_init" ]; then
    echo "Running database init"
    sqlite3 /data/database.db < init_db.sql
    echo "Init complete"
fi

schema_not_changed_hash="bb78723ad3f70982ed78a0da36c2ac45399aa536"
is_schema_already_initialized="./already_did_schema"
schema_hash=$(sha1sum seed_db.sql | cut -d ' ' -f 1)

# We check if the schema contents has changed, and if it has, we run the seed_db.sql
# file. We also check if the schema has already been initialized, and if it has, we
# don't run the seed_db.sql file.
if [ ! -f "$is_schema_already_initialized" ] && [ "$schema_not_changed_hash" != "$schema_hash" ]; then
    echo "Running database seed"
    sqlite3 /data/database.db < seed_db.sql
    touch "$is_schema_already_initialized"
    echo "Seed complete"
fi

python wsgi.py /data/database.db