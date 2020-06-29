FROM python:3.7-alpine

WORKDIR /usr/src

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /usr/src/requirements.txt

RUN apk update \
	&& apk add --virtual \
	build-deps \
	gcc \
	python3-dev \
	musl-dev \
	postgresql-dev \
	&& pip install --upgrade pip \
	&& pip install -r requirements.txt

COPY . /usr/src/

ENTRYPOINT ["/usr/src/entrypoint.sh"]