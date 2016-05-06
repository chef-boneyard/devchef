.PHONY: all
all: delivery insights

.PHONY: delivery
delivery: delivery_web_base delivery_web_test postgres sqitch

.PHONY: insights
insights: insights_logstash_base insights_web_base

.PHONY: delivery_web_base
delivery_web_base:
	docker build -t devchef/delivery_web_base:latest -f delivery_web_base/Dockerfile delivery_web_base

.PHONY: delivery_web_test
delivery_web_test:
	docker build -t devchef/delivery_web_test:latest -f delivery_web_test/Dockerfile delivery_web_test

.PHONY: postgres
postgres:
	docker build -t devchef/postgres:latest -f postgres/Dockerfile postgres
	docker build -t devchef/postgres:pgtap -f postgres/Dockerfile-pgtap postgres

.PHONY: sqitch
sqitch:
	docker build -t devchef/sqitch:latest -f sqitch/Dockerfile sqitch

.PHONY: insights_logstash_base
insights_logstash_base:
	docker build -t devchef/insights_logstash_base:latest -f insights_logstash_base/Dockerfile insights_logstash_base

.PHONY: insights_web_base
insights_web_base:
	docker build -t devchef/insights_web_base:latest -f insights_web_base/Dockerfile insights_web_base
