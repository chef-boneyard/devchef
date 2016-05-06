FROM erlang:18
MAINTAINER Tom Duffield <tom@chef.io>

RUN mkdir -p /git/repos /git/working_tree /git/server_keys /etc/delivery /usr/src/app /usr/src/license

COPY ./wait-for-it.sh /wait-for-it.sh

RUN git config --global user.email "delivery@chef.io" && \
    git config --global user.name "Chef Delivery"

WORKDIR /usr/src/app

ENV ERL_FLAGS -smp enable
ENV HOME /etc/delivery
ENV APP_DIR /usr/src/app
