FROM postgres:12.5-alpine

USER root

RUN mkdir -p /opt/pgdata && \
    chown postgres:postgres /opt/pgdata

USER postgres

COPY extensions.sql /docker-entrypoint-initdb.d
