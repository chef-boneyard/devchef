FROM perl:latest
MAINTAINER Chef Software, Inc. <docker@chef.io>

RUN apt-get update && \
    apt-get install cpanminus postgresql-client-common postgresql-client -y --no-install-recommends && \
    apt-get clean

# Install pg_prove after sqitch and perl postgres driver
RUN cpanm --quiet --notest App::Sqitch && \
    cpanm --quiet --notest DBD::Pg && \
    cpanm --quiet --notest TAP::Parser::SourceHandler::pgTAP

COPY ./wait-for-it.sh /wait-for-it.sh

VOLUME ["/src"]
WORKDIR /src

CMD ["sqitch"]

