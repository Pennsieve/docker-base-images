FROM openjdk:8-jre-alpine3.7

ARG CLOUDWRAP_VERSION=0.5.9

RUN apk add --no-cache --update python \
                                py2-pip \
                                openssl \
                                bash && \
    pip install --upgrade pip


RUN wget -O cloudwrap_${CLOUDWRAP_VERSION}_x86_64.apk \
    https://github.com/Pennsieve/cloudwrap/releases/download/${CLOUDWRAP_VERSION}/cloudwrap_${CLOUDWRAP_VERSION}_x86_64.apk

RUN apk add --allow-untrusted cloudwrap_${CLOUDWRAP_VERSION}_x86_64.apk

RUN pip install awscli

CMD ["cloudwrap", "--help"]
