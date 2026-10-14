#!/bin/sh
# Generate a fresh self-signed certificate for this container, then run the
# image's command. ALBs don't validate target certificates, so the cert only
# has to encrypt ALB-to-task traffic; a per-task key means no key is stored in
# the image or shared between services.
set -eu

CERT_DIR=/etc/nginx/certs

openssl req -x509 -newkey rsa:2048 -nodes -days 3650 \
    -subj "/CN=nginx-sidecar" \
    -keyout "$CERT_DIR/$CERTIFICATE_KEY_NAME" \
    -out "$CERT_DIR/$CERTIFICATE_NAME" 2>/dev/null
chmod 600 "$CERT_DIR/$CERTIFICATE_KEY_NAME"

exec /docker-entrypoint.sh "$@"
