# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BUILD IMAGE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ARG PANDAS_VERSION

FROM blackfynn/pandas:${PANDAS_VERSION} as build

# needed by nextflow
RUN apk -v add --no-cache bash && \
    pip install --no-cache-dir awscli==1.14 boto3==1.6

ENTRYPOINT [""]

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TEST IMAGE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FROM blackfynn/pandas:${PANDAS_VERSION} as test

# needed by nextflow
RUN apk -v --update add --no-cache bash && \
    pip install --upgrade awscli==1.14 boto3==1.6

# needed by all python tests
RUN apk add --no-cache gcc musl-dev libffi-dev libressl-dev && \
    pip install --no-cache-dir moto pylint pytest pytest-cov

ENTRYPOINT [""]