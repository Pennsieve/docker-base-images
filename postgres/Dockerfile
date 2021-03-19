FROM postgres:9.6.4-alpine

USER root

RUN mkdir -p /opt/pgdata && \
    chown postgres:postgres /opt/pgdata

USER postgres

COPY extensions.sql /docker-entrypoint-initdb.d
