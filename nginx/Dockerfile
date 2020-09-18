FROM python:3.8.5-slim AS server

RUN mkdir /server && apt-get update && apt-get install -y git
WORKDIR /server

ADD ./server/requirements/prod.txt /server/requirements.txt
RUN pip install -r requirements.txt

ADD ./server /server

RUN python ./manage.py collectstatic --noinput

#########################################

FROM nginx:1.19.2

RUN rm -v /etc/nginx/nginx.conf
ADD ./nginx/nginx.conf /etc/nginx/

RUN mkdir /nginx
COPY --from=server /server/config/staticfiles /nginx/static
