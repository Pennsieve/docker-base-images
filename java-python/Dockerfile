FROM openjdk:8-jre-alpine3.7

RUN apk add --no-cache --update python \
                                py2-pip \
                                bash && \
    pip install --upgrade pip

RUN pip install awscli

RUN addgroup -S blackfynn && \
    adduser -S -D blackfynn -G blackfynn
