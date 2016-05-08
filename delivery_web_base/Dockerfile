FROM node:5.6.0
MAINTAINER Chef Software, Inc. <docker@chef.io>

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN \
  apt-get update && \
  apt-get install rsync -y
