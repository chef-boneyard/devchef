# using this for its included ruby + openssl
FROM devchef/chefdk
MAINTAINER Chef Software, Inc. <docker@chef.io>

VOLUME /reports
RUN apt-get -q update && apt-get install -y --no-install-recommends dnsutils bsdmainutils

COPY testssl.rb /testssl.rb

CMD ["/opt/chefdk/bin/chef-apply", "testssl.rb"]
