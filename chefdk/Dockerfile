FROM ubuntu:14.04
MAINTAINER Chef Software <docker@chef.io>

ARG CHEFDK_VERSION=0.17.17
ARG CHANNEL=stable

RUN apt-get update && apt-get install -y wget curl ssh && \
    wget --content-disposition https://packages.chef.io/${CHANNEL}/ubuntu/12.04/chefdk_${CHEFDK_VERSION}-1_amd64.deb && \
    dpkg -i chefdk*.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* chef*.deb

ENV PATH=/opt/chefdk/bin:/opt/chefdk/embedded/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
