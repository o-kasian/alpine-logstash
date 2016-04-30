#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
  set -- logstash "$@"
fi

if [ "$1" = 'logstash' -a "$(id -u)" = '0' ]; then
  set -- gosu logstash "$@"
fi

exec "$@"
