FROM matteofigus/docker-sqitch
MAINTAINER Chef Software, Inc. <docker@chef.io>

# Install pg_prove
RUN apt-get install cpanminus -y && \
  cpanm --quiet --notest TAP::Parser::SourceHandler::pgTAP

COPY ./wait-for-it.sh /wait-for-it.sh
