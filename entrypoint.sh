#!/bin/sh

already_did_init="/data/database.db"

if [ ! -e "$already_did_init" ]; then
    echo "Running database init"
    sqlite3 /data/database.db
fi

python wsgi.py /data/database.db