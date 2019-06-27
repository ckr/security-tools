FROM justckr/ubuntu-base:latest

MAINTAINER Constantinos Kouloumbris <c@kouloumbris.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt-get update && \
	apt-get install -y build-essential \
	libtool \
	pkg-config \
	debhelper \
	autotools-dev \
	python-all-dev \
	dh-autoreconf \
	python-pip

RUN \
	git clone https://github.com/csababarta/ntdsxtract.git && \
	cd ntdsxtract && \
	pip install pycrypto

RUN mkdir -p /secure/home

WORKDIR /secure/home

# ENTRYPOINT ["bash"]
ENTRYPOINT ["/ntdsxtract/dsusers.py"]