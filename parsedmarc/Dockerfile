FROM pypy:3.5-7-slim

MAINTAINER Constantinos Kouloumbris <c@kouloumbris.com>

ENV PARSEDMARC_VERSION 6.5.4
RUN apt-get update \
    && apt-get install -y gcc \
    && pip install -U parsedmarc==$PARSEDMARC_VERSION \
    && rm -rf /root/.cache/ \
    && apt-get purge -y gcc \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg}/

RUN mkdir -p /secure/home

WORKDIR /secure/home

ENTRYPOINT ["/usr/local/bin/parsedmarc"]