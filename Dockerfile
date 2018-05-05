FROM python:3.6.5-jessie
ENV PYTHONUNBUFFERED 1

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
  apt-get update && apt-get install -y \
    gdal-bin \
    supervisor \
    postgresql-common/jessie-backports \
    postgresql-client-9.6/jessie-backports -qq && \
  rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
