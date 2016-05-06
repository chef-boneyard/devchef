FROM logstash:2.3.1
MAINTAINER Tom Duffield <tom@chef.io>

RUN logstash-plugin install --development
RUN logstash-plugin install --no-verify uuidtools
RUN logstash-plugin install logstash-output-websocket
RUN logstash-plugin install logstash-filter-checksum
RUN logstash-plugin install logstash-filter-clone

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash", "agent"]
