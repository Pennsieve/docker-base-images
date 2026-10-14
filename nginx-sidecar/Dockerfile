# Pinned to a stable line so a rebuild is a deliberate upgrade. The image
# includes njs (ngx_http_js_module), which the gateway loads.
FROM nginx:1.30-alpine

# The certificate is generated per container by entrypoint.sh. These names
# are what the nginx templates (here and in the gateway) reference.
ENV CERTIFICATE_NAME=pennsieve.crt \
    CERTIFICATE_KEY_NAME=pennsieve.key

COPY ./nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl
COPY ./entrypoint.sh /usr/local/bin/sidecar-entrypoint.sh

RUN apk upgrade --no-cache && \
    apk add --no-cache openssl && \
    chmod 755 /usr/local/bin/sidecar-entrypoint.sh && \
    mkdir -p /etc/nginx/certs && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx

USER nginx

ENTRYPOINT ["/usr/local/bin/sidecar-entrypoint.sh"]

CMD /bin/sh -c "envsubst '$PARAMS' < /etc/nginx/nginx.conf.tmpl > /etc/nginx/nginx.conf \
    && nginx -g 'daemon off;' \
    || cat /etc/nginx/nginx.conf"
