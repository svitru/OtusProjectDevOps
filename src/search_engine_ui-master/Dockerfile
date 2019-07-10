FROM python:3.6.0-alpine

WORKDIR /app
ADD . /app

RUN apk update
RUN apk add gcc
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev
RUN pip3 install -r requirements.txt

ENV MONGO db

