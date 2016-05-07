FROM node:5.6.0
MAINTAINER Tom Duffied <tom@chef.io>

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN \
  apt-get update && \
  apt-get install rsync -y
