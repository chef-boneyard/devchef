FROM ubuntu:14.04

ENV CHEFDK_VERSION 0.16.28

ENV SERVER_URL https://chef-server
ENV ORG_NAME local
ENV VALIDATOR_NAME local_validator
ENV VALIDATOR_KEY /etc/chef/local_validator.pem

RUN apt-get update && apt-get install -y wget curl && \
    wget --content-disposition https://packages.chef.io/stable/ubuntu/12.04/chefdk_${CHEFDK_VERSION}-1_amd64.deb && \
    dpkg -i chefdk*.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* chef*.deb push-jobs-client*.deb

COPY run.sh /run.sh

CMD ["bash", "/run.sh"]
