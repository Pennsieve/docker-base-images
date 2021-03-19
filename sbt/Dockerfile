FROM openjdk:8u131-jdk-alpine

# sbt user is used for the original jenkins
# jenkins user is used for the jenkins instance in the operations VPC
RUN apk add --no-cache bash curl tar && \
     addgroup -g 116 -S sbt && \
     adduser -u 112 -S -G sbt sbt && \
     addgroup -g 1000 -S jenkins && \
     adduser -u 1000 -S -G jenkins jenkins

ARG SBT_VERSION
ENV SBT_HOME /usr/local/sbt-launcher-packaging-${SBT_VERSION}
ENV PATH ${PATH}:${SBT_HOME}/bin

WORKDIR /usr/local

# Install sbt
RUN curl -fsSL "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | tar zx && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt

WORKDIR /sbt

RUN chown sbt:sbt /sbt

USER sbt

RUN sbt sbtVersion

ENTRYPOINT ["/usr/local/sbt/bin/sbt"]

CMD []
