FROM java:jre-alpine

ENV GOSU_VERSION 1.9
ENV LOGSTASH_VERSION 2.3.4

RUN apk update && apk add curl bash && \
    curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu && \
    gosu nobody true && \
    curl -o logstash.tar.gz -sSL "https://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz" && \
    tar -xzf logstash.tar.gz && \
    rm logstash.tar.gz && \
    mkdir /opt && \
    mv logstash-$LOGSTASH_VERSION /opt/logstash && \
    mkdir /etc/logstash && \
    adduser -DH -s /sbin/nologin logstash && \
    apk del curl && \
    rm -rf /var/cache/apk/*

ENV PATH /opt/logstash/bin:$PATH

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash", "agent"]
