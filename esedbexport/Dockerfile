FROM alpine:latest

LABEL maintainer="Constantinos Kouloumbris <c@kouloumbris.com>"

ENV LIBUNA_VERSION 20190102
ENV LIBESEDB_VERSION 20181229

WORKDIR /usr/src/app

RUN apk update \
  && apk add --virtual .deps build-base \
                             ca-certificates \
                             wget \
  # Install libuna (because libesedb won't install with local one smh)
  && wget --output-document=libuna.tar.gz https://github.com/libyal/libuna/releases/download/${LIBUNA_VERSION}/libuna-alpha-${LIBUNA_VERSION}.tar.gz \
  && tar -xvzf libuna.tar.gz \
  && cd libuna-${LIBUNA_VERSION} \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf libuna* \
  \
  # Install libesedb
  && wget --output-document=libesedb.tar.gz https://github.com/libyal/libesedb/releases/download/${LIBESEDB_VERSION}/libesedb-experimental-${LIBESEDB_VERSION}.tar.gz \
  && tar -xvzf libesedb.tar.gz \
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
  && adduser -D esedb \
  && mkdir -p /secure/home

USER esedb

WORKDIR /secure/home

ENTRYPOINT ["esedbexport"]
