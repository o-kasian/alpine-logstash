# Logstash docker image based on Alpine Linux

### Build

```bash
$ make build
```

### DockerHub

This image is published on DockerHub as `gafiatulin/alpine-logstash`.

[Click here to see it's DockerHub homepage](https://hub.docker.com/r/gafiatulin/alpine-logstash/)

### Usage

##### Start Logstash with commandline configuration

If you need to run logstash with configuration provided on the commandline, you can use the logstash image as follows:

```console
$ docker run -it --rm logstash logstash -e 'input { stdin { } } output { stdout { } }'
```

##### Start Logstash with configuration file

If you need to run logstash with a configuration file, `logstash.conf`, that's located in your current directory, you can use the logstash image as follows:

```console
$ docker run -it --rm -v "$PWD":/config-dir logstash logstash -f /config-dir/logstash.conf
```
