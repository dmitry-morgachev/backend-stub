FROM python:3.9.4-slim

RUN mkdir /server && apt-get update && apt-get install -y git libpq-dev postgresql-client
WORKDIR /server

ADD ./server/requirements/prod.txt /server/prod.txt
ADD ./server/requirements/dev.txt /server/requirements.txt

RUN pip install -r requirements.txt
