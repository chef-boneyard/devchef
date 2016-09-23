FROM devchef/chefdk:stable
MAINTAINER Chef Software <docker@chef.io>

ENV	DEBIAN_FRONTEND noninteractive

ARG CHEF_CHANNEL

ENV CHEF_CHANNEL ${CHEF_CHANNEL:-stable}
ENV CHEF_FQDN chef-server
ENV CHEF_USER super
ENV CHEF_NAME Super User
ENV CHEF_PASS password
ENV CHEF_EMAIL super@chef.io
ENV CHEF_ORG_SHORT local
ENV CHEF_ORG_FULL Local Development

VOLUME /volumes/keys

COPY setup.rb install.rb run.sh /

RUN chef-apply install.rb

EXPOSE 443

CMD ["bash", "-c", "/run.sh"]
