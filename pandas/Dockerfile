ARG IMAGE_TAG=2.7.17-alpine3.9
FROM python:$IMAGE_TAG

ARG NUMPY_VERSION
ARG PANDAS_VERSION

RUN apk add --no-cache python-dev py-pip && \
    apk add --no-cache --virtual .build-deps g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install numpy==${NUMPY_VERSION} pandas==${PANDAS_VERSION} && \
    apk del .build-deps
