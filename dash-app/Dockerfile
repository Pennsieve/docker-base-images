ARG IMAGE_TAG=3.9-slim
FROM --platform=linux/amd64 python:$IMAGE_TAG

ARG PANDAS_VERSION
ARG DASH_VERSION

RUN pip install dash==${DASH_VERSION} pandas==${PANDAS_VERSION}