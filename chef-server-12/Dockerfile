FROM ubuntu:14.04

ENV	DEBIAN_FRONTEND noninteractive
ENV CHEF_SERVER_VERSION 12.8.0
ENV PUSH_JOBS_SERVER_VERSION 1.1.6

ENV CHEF_USER foobear
ENV CHEF_NAME Foo Bear
ENV CHEF_PASS foopass
ENV CHEF_EMAIL foo@chef.io
ENV CHEF_ORG_SHORT foo
ENV CHEF_ORG_FULL Foo Organization

VOLUME /volumes/keys

COPY setup.sh run.sh /usr/local/bin/

RUN apt-get update && apt-get install -y wget curl && \
    wget --content-disposition https://chef.bintray.com/stable-apt/ubuntu/14.04/chef-server-core_$CHEF_SERVER_VERSION-1_amd64.deb && \
    dpkg -i chef-server*.deb && \
    wget --content-disposition https://packages.chef.io/stable/ubuntu/14.04/opscode-push-jobs-server_$PUSH_JOBS_SERVER_VERSION-1_amd64.deb && \
    dpkg -i opscode-push-jobs-server*.deb && \
    /usr/local/bin/setup.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /*.deb

EXPOSE 443


CMD ["/usr/local/bin/run.sh"]
