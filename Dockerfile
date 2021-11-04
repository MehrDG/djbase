FROM python:3.9-alpine3.14

LABLE org.opencontainers.image.authors="ghani.mehrdad@gmail.com"
LABLE version="0.1"


ENV PYTHONUNBUFFERED 1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1


COPY ./requirements.txt/common-requirements.txt


RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip
RUN apk add --update --no-cache postgresql-client
RUN apk add --update postgresql-client build-base postgresql-dev musl-dev linux-headers libffi-dev libxslt-dev libxml2-dev
RUN    apk add --update --no-cache --vitual .tmp-deps \
        build-base postgresql-dev musl-dev linux-headers libffi-dev libjpeg zlib-dev jpeg-dev gcc musl-dev libxslt libxml2


Run /py/bin/pip install -r /common-requirements.txt
