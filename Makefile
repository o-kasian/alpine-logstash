build:
	docker build -t alpine-logstash --rm=true .

debug:
	docker run -i -t --entrypoint=sh alpine-logstash

run:
	docker run -i -P alpine-logstash