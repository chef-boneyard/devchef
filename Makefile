.PHONY: all build-all push-all
all: build-all push-all
build-all: erlang-18-build logstash-2.3-build node-5.6-build postgres-9.5-build sqitch-build
push-all: erlang-18-push logstash-2.3-push node-5.6-push postgres-9.5-push sqitch-push

.PHONY: erlang-18-build erlang-18-push
erlang-18-build:
	docker build -t devchef/erlang-18:latest -f erlang-18/Dockerfile erlang-18
	docker build -t devchef/erlang-18:delivery -f erlang-18/Dockerfile-Delivery erlang-18

erlang-18-push:
	docker push devchef/erlang-18

.PHONY: logstash-2.3-build logstash-2.3-push
logstash-2.3-build:
	docker build -t devchef/logstash-2.3:latest -f logstash-2.3/Dockerfile logstash-2.3
	docker build -t devchef/logstash-2.3:insights -f logstash-2.3/Dockerfile-Insights logstash-2.3

logstash-2.3-push:
	docker push devchef/logstash-2.3

.PHONY: postgres-9.5-build postgres-9.5-push
postgres-9.5-build:
	docker build -t devchef/postgres-9.5:latest -f postgres-9.5/Dockerfile postgres-9.5
	docker build -t devchef/postgres-9.5:pgtap -f postgres-9.5/Dockerfile-pgtap postgres-9.5

postgres-9.5-push:
	docker push devchef/postgres-9.5

.PHONY: sqitch-build sqitch-push
sqitch-build:
	docker build -t devchef/sqitch:latest -f sqitch/Dockerfile sqitch

sqitch-push:
	docker push devchef/sqitch

.PHONY: node-5.6-build node-5.6-push
node-5.6-build:
	docker build -t devchef/node-5.6:latest -f node-5.6/Dockerfile node-5.6
	docker build -t devchef/node-5.6:test -f node-5.6/Dockerfile-test node-5.6

node-5.6-push:
	docker push devchef/node-5.6
