FROM logstash:2.3.1
MAINTAINER Chef Software, Inc. <docker@chef.io>

RUN logstash-plugin install --development 

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash", "agent"]
