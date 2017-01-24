FROM ubuntu:14.04
MAINTAINER Chef Software <docker@chef.io>

ARG CHANNEL=stable

RUN apt-get update && apt-get install -y wget curl ssh build-essential && \
    curl -L https://omnitruck.chef.io/install.sh | bash -s -- -c ${CHANNEL} -P chefdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=/opt/chefdk/bin:/opt/chefdk/embedded/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
