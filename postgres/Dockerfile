FROM postgres:16.3-alpine

USER root

RUN mkdir -p /opt/pgdata && \
    chown postgres:postgres /opt/pgdata

USER postgres

COPY extensions.sql /docker-entrypoint-initdb.d
