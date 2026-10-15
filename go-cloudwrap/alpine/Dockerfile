FROM golang:1.27-alpine

ARG TARGETARCH=amd64
ARG CLOUDWRAP_VERSION=1.0.1
ARG CLOUDWRAP_SHA256_amd64=75dd4be234085fba78ed58c191de2c12fe168f6bce062f613ef7c7930c8de506
ARG CLOUDWRAP_SHA256_arm64=6b4ff71e5c0a4ce87c864742e6662656c9e1a246e17bab900e4f0d9288f12a17

RUN set -eu; \
    apk upgrade --no-cache; \
    apk add --no-cache openssl; \
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
    addgroup -S pennsieve; \
    adduser -S -D pennsieve -G pennsieve

USER pennsieve

ENTRYPOINT ["cloudwrap"]
CMD ["--help"]
