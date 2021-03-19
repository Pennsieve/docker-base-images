# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BUILD IMAGE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FROM python:2.7-alpine3.7 as build

# needed by nextflow
RUN apk -v add --no-cache bash && \
    pip install --no-cache-dir awscli==1.14 boto3==1.6

ENTRYPOINT [""]

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TEST IMAGE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FROM python:2.7-alpine3.7 as test

# needed by nextflow
RUN apk -v --update add --no-cache bash && \
    pip install --upgrade awscli==1.14 boto3==1.6

# needed by all python tests
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev && \
    pip install --no-cache-dir moto pylint pytest pytest-cov

ENTRYPOINT [""]