FROM python:3.8.5-slim

RUN mkdir /server && apt-get update && apt-get install -y git libpq-dev postgresql-client
WORKDIR /server

ADD ./server/requirements/prod.txt /server/prod.txt
ADD ./server/requirements/dev.txt /server/requirements.txt
ADD ./deploy/wait-for-postgres.sh /server/wait-for-postgres.sh

RUN pip install -r requirements.txt
