FROM python:3.7-alpine3.17

WORKDIR /app

RUN pip install gevent sqlite_web
RUN apk add --no-cache sqlite

COPY entrypoint.sh .
COPY wsgi.py .
COPY init_db.sql .
COPY seed_db.sql .

ENTRYPOINT [ "./entrypoint.sh" ]
