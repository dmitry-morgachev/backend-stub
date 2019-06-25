FROM python:3.7-slim

RUN mkdir /server && apt-get update && apt-get install -y git
WORKDIR /server

ADD ./server/requirements.txt /server/requirements.txt
RUN pip install -r requirements.txt
