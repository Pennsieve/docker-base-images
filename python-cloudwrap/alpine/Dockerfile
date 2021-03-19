FROM python:3.7-alpine

RUN apk update && apk add --no-cache openssl

ARG CLOUDWRAP_VERSION=0.5.9

RUN wget -O cloudwrap_${CLOUDWRAP_VERSION}_x86_64.apk \
        https://github.com/Pennsieve/cloudwrap/releases/download/${CLOUDWRAP_VERSION}/cloudwrap_${CLOUDWRAP_VERSION}_x86_64.apk
RUN apk add --no-cache --allow-untrusted cloudwrap_${CLOUDWRAP_VERSION}_x86_64.apk && \
    rm cloudwrap_${CLOUDWRAP_VERSION}_x86_64.apk

RUN addgroup -S pennsieve && \
    adduser -S -D pennsieve -G pennsieve

USER pennsieve

ENTRYPOINT ["cloudwrap"]
CMD ["--help"]
