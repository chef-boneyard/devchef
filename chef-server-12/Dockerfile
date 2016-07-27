FROM ubuntu:14.04

ENV	DEBIAN_FRONTEND noninteractive
ENV CHEF_SERVER_VERSION 12.8.0

ENV CHEF_USER super
ENV CHEF_NAME Super User
ENV CHEF_PASS password
ENV CHEF_EMAIL super@chef.io
ENV CHEF_ORG_SHORT local
ENV CHEF_ORG_FULL Local Development

VOLUME /volumes/keys

COPY setup.sh run.sh /usr/local/bin/

RUN apt-get update && apt-get install -y wget curl && \
    wget --content-disposition https://chef.bintray.com/stable-apt/ubuntu/14.04/chef-server-core_$CHEF_SERVER_VERSION-1_amd64.deb && \
    dpkg -i chef-server*.deb && \
    /usr/local/bin/setup.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* chef-server*.deb

EXPOSE 443


CMD ["/usr/local/bin/run.sh"]
