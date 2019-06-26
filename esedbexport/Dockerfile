FROM justckr/ubuntu-base:latest

MAINTAINER Constantinos Kouloumbris <c@kouloumbris.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt-get update && \
	apt-get install -y build-essential \
	autoconf \
	automake \
	autopoint \
	libtool \
	pkg-config \
	debhelper \
	fakeroot \
	autotools-dev \
	python-all-dev \
	dh-autoreconf \
	python3-all-dev

RUN \
	git clone https://github.com/libyal/libesedb.git && \
	cd libesedb && \
	./synclibs.sh && \
	./autogen.sh && \
	./configure && \
	cp -rf dpkg debian && \
	dpkg-buildpackage -b -rfakeroot -us -uc

RUN mkdir -p /secure/home

WORKDIR /secure/home

ENTRYPOINT ["/libesedb/esedbtools/esedbexport"]