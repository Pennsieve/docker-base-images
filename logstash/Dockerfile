FROM openjdk:8u131-jre-alpine

RUN apk add --no-cache bash curl libc6-compat tar && \
    addgroup -g 750 -S logstash && \
    adduser -u 750 -D -S -G logstash logstash

ENV HOME_DIR /usr/share/logstash
ENV VERSION 6.4.1

WORKDIR ${HOME_DIR}

RUN curl -fsSL https://artifacts.elastic.co/downloads/logstash/logstash-${VERSION}.tar.gz | tar zx --strip-components=1

RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-csv \
                                                    logstash-input-cloudwatch_logs \
                                                    logstash-input-s3

COPY ./assets/ /usr/share/logstash/config/conf.d/

RUN chown -R logstash:logstash ${HOME_DIR} ${HOME_DIR}/*

USER logstash

EXPOSE 9600

ENTRYPOINT ["/usr/share/logstash/bin/logstash"]

CMD []
