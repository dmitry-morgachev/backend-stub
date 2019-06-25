FROM python:3.7-slim AS server

RUN mkdir /server && apt-get update && apt-get install -y git
WORKDIR /server

ADD ./server/requirements.txt /server/requirements.txt
RUN pip install -r requirements.txt

ADD ./server /server

RUN python ./manage.py collectstatic --noinput

#########################################

FROM nginx:1.13

RUN rm -v /etc/nginx/nginx.conf
ADD ./nginx/nginx.conf /etc/nginx/

RUN mkdir /nginx
COPY --from=server /server/staticfiles /nginx/static
