FROM erlang:18
MAINTAINER Chef Software, Inc. <docker@chef.io>

WORKDIR /usr/src/app

ENV ERL_FLAGS -smp enable
ENV APP_DIR /usr/src/app

COPY ./wait-for-it.sh /wait-for-it.sh
