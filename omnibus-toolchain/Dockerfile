FROM ubuntu:14.04
MAINTAINER Chef Software <docker@chef.io>

ARG CHANNEL=stable

COPY load-omnibus-toolchain.sh /load-omnibus-toolchain.sh
COPY omnibus.sh /omnibus.sh

RUN apt-get update && apt-get install -y curl devscripts dpkg-dev ncurses-dev zlib1g-dev && \
    curl -L https://omnitruck.chef.io/install.sh | bash -s -- -c ${CHANNEL} -P omnibus-toolchain && \
    /opt/omnibus-toolchain/bin/git config --global user.email "nobody@chef.io" && \
    /opt/omnibus-toolchain/bin/git config --global user.name "Chef" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV GIT_DISCOVERY_ACROSS_FILESYSTEM true

WORKDIR /project/omnibus

ENTRYPOINT ["/omnibus.sh"]
