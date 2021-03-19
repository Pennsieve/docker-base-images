FROM openjdk:8-jre-alpine

RUN apk add --no-cache curl tar && \
     addgroup -g 1000 -S jenkins && \
     adduser -u 1000 -S -G jenkins jenkins

ARG FLYWAY_VERSION=4.2.0

WORKDIR /usr

RUN curl -fsSL "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz" | tar zx && \
    mv flyway-${FLYWAY_VERSION} flyway && \
    sed -i 's/bash/sh/' flyway/flyway && \
    ln -s /usr/flyway/flyway /usr/local/bin/flyway && \
    chmod +x /usr/flyway/flyway

USER jenkins

ENTRYPOINT ["flyway"]

CMD ["--help"]
