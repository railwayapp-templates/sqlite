FROM python:3.7-alpine3.17

WORKDIR /app

RUN pip install gevent sqlite_web
RUN apk add --no-cache sqlite

COPY entrypoint.sh .
COPY wsgi.py .

ARG WEB_UI_PASSWORD
ENV WEB_UI_PASSWORD=$WEB_UI_PASSWORD

ENTRYPOINT [ "./entrypoint.sh" ]