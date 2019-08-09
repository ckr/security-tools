FROM alpine:latest

MAINTAINER Constantinos Kouloumbris <c@kouloumbris.com>

ENV LIBUNA_VERSION 20190102
ENV LIBESEDB_VERSION 20181229

WORKDIR /usr/src/app

RUN apk update \
  && apk add --virtual .deps build-base \
                             ca-certificates \
                             curl \
  # Install libuna (because libesedb won't install with local one smh)
  && curl -sLo libuna.tar.gz https://github.com/libyal/libuna/releases/download/${LIBUNA_VERSION}/libuna-alpha-${LIBUNA_VERSION}.tar.gz \
  && tar xf libuna.tar.gz \
  && cd libuna-${LIBUNA_VERSION} \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf libuna* \
  \
  # Install libesedb
  && curl -sLo libesedb.tar.gz https://github.com/libyal/libuna/releases/download/${LIBESEDB_VERSION}/libesedb-experimental-${LIBESEDB_VERSION}.tar.gz \
  && tar xf libesedb.tar.gz \
  && cd libesedb-${LIBESEDB_VERSION} \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf libesedb* \
  \
  # Clean up
  && apk del .deps \
  && rm -rf /var/cache/apk/* \
  \
  # Add regular user
  && adduser -D esedb

USER esedb

RUN mkdir -p /secure/home
WORKDIR /secure/home

ENTRYPOINT ["esedbexport"]