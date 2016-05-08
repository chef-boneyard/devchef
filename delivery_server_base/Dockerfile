FROM erlang:18
MAINTAINER Chef Software, Inc. <docker@chef.io>

WORKDIR /usr/src/app

ENV ERL_FLAGS -smp enable
ENV HOME /etc/delivery
ENV APP_DIR /usr/src/app

COPY ./wait-for-it.sh /wait-for-it.sh

RUN \
  mkdir -p /git/repos /git/working_tree /git/server_keys /etc/delivery /usr/src/app /usr/src/license && \
  git config --global user.email "delivery@chef.io" && \
  git config --global user.name "Chef Delivery"
