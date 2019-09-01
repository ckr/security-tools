FROM python:2.7

LABEL maintainer="Constantinos Kouloumbris <c@kouloumbris.com>"

WORKDIR /usr/src/app

RUN git clone https://github.com/csababarta/ntdsxtract.git .
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p /secure/home
WORKDIR /secure/home

ENTRYPOINT ["/usr/src/app/dsusers.py"]