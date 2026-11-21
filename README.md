<img style="max-width: 100%;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/SQLite370.svg/2560px-SQLite370.svg.png" />

<h1 align="center">SQLite Template</h1>

SQLite3 is a lightweight, serverless, open-source database engine used for local storage in applications. It requires no configuration and supports SQL for data manipulation.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/jOiNFt?referralCode=chIZYq)

# ✨ Features

- SQLite3 database
- SQLite Web Interface
- `trains` table with sample data about Thomas & Friends (do you still need more features?)

# 🤔 How to use

## 🌎 WebUI Usage

1. Open the project named "SQLite Template"

2. Go to the "Variables" tab and view the `SQLITE_WEB_UI_PASSWORD` variable, this is the password you'll need to access the web interface

3. Back to `Deployments`, in the top you'll see a URL which you can use to access the web interface

4. Click on the URL and you'll be redirected to the web interface, type your password and you'll be able to manage your database

That's it! You can now manage your SQLite3.

## ⚙️ `seed_db.sql` Usage

After you've deployed this template, you'll find a copy of this project in your Github.  
From there you can populate `seed_db.sql` with your own SQL code.  
The file will only be executed when you change anything in it and will run only once.

## ⚙️ `init_db.sql` Usage

This file is used to initialize the database.  
It includes sample data for a `trains` table.

## Export a consistent SQLite snapshot

Keep the service running while you export. Use `railway ssh` to open a shell inside the deployed service. The database in this template is `/data/database.db`. Create a snapshot in a new private directory on the mounted volume:

```sh
umask 077
snapshot_dir=$(mktemp -d /data/sqlite-export.XXXXXX) &&
  sqlite3 -batch -bail -readonly /data/database.db ".backup '$snapshot_dir/database.db'" &&
  printf '%s\n' "$snapshot_dir/database.db"
```

From a private local directory outside your Git checkout, download the snapshot using the path **relative to the volume root**. For example, if the shell printed `/data/sqlite-export.AB12CD/database.db`:

```sh
umask 077
railway volume files download /sqlite-export.AB12CD/database.db ./database.db &&
  sqlite3 -batch -bail -readonly ./database.db 'PRAGMA integrity_check;'
```

Expect `ok` and compare a recent known record in the downloaded copy with the source. In WAL mode, simply copying the open database's main file can miss committed records even if that copy passes the integrity check. Keep the verified download somewhere private and remove the temporary export from the volume when it is no longer needed.

[Railway file downloads](https://docs.railway.com/cli/volume#download-a-file-from-a-volume) · [SQLite Backup API](https://www.sqlite.org/backup.html)

# 📙 Learn more

- [SQLite3](https://www.sqlite.org/index.html)
- [SQLite Web](https://github.com/coleifer/sqlite-web)
