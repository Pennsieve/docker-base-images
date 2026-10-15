# Base for the Pennsieve JVM services: Temurin 21 JRE on Alpine, with
# cloudwrap as the entrypoint. The `tomcat` stage adds Tomcat 9 (still
# javax.servlet) for pennsieve-api's war.
#
# Pinned to a stable Alpine line, like nginx-sidecar, so a rebuild is a
# deliberate upgrade; `apk upgrade` picks up the line's security fixes.
FROM eclipse-temurin:21-jre-alpine-3.24 AS java

ARG TARGETARCH=amd64
ARG CLOUDWRAP_VERSION=1.0.1
ARG CLOUDWRAP_SHA256_amd64=75dd4be234085fba78ed58c191de2c12fe168f6bce062f613ef7c7930c8de506
ARG CLOUDWRAP_SHA256_arm64=6b4ff71e5c0a4ce87c864742e6662656c9e1a246e17bab900e4f0d9288f12a17

RUN set -eu; \
    apk upgrade --no-cache; \
    case "$TARGETARCH" in \
      amd64) sha="$CLOUDWRAP_SHA256_amd64" ;; \
      arm64) sha="$CLOUDWRAP_SHA256_arm64" ;; \
      *) echo "unsupported arch $TARGETARCH"; exit 1 ;; \
    esac; \
    apk="cloudwrap_${CLOUDWRAP_VERSION}_linux_${TARGETARCH}.apk"; \
    wget -q -O "/tmp/$apk" "https://github.com/Pennsieve/cloudwrap/releases/download/${CLOUDWRAP_VERSION}/$apk"; \
    echo "$sha  /tmp/$apk" | sha256sum -c -; \
    apk add --no-cache --allow-untrusted "/tmp/$apk"; \
    rm "/tmp/$apk"; \
    ln -s "$JAVA_HOME/bin/java" /usr/bin/java; \
    addgroup -S pennsieve; \
    adduser -S -D pennsieve -G pennsieve

USER pennsieve

ENTRYPOINT ["cloudwrap"]
CMD ["--help"]


FROM java AS tomcat

ARG TOMCAT_VERSION=9.0.123
ARG TOMCAT_SHA512=64b1130e719399c0a409e6996081433b16af8d9c89266c7aaa9849af70a1815feca91e13896f5ccc41451dc5759716d1c84882682de955822c30509de102f290

ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

USER root

RUN set -eu; \
    tarball="apache-tomcat-${TOMCAT_VERSION}.tar.gz"; \
    wget -q -O "/tmp/$tarball" "https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/$tarball"; \
    echo "$TOMCAT_SHA512  /tmp/$tarball" | sha512sum -c -; \
    mkdir -p "$CATALINA_HOME"; \
    tar -xzf "/tmp/$tarball" -C "$CATALINA_HOME" --strip-components=1; \
    rm "/tmp/$tarball"; \
    rm -rf "$CATALINA_HOME"/webapps/* "$CATALINA_HOME"/bin/*.bat; \
    chown -R pennsieve:pennsieve "$CATALINA_HOME"

WORKDIR $CATALINA_HOME

USER pennsieve

EXPOSE 8080
