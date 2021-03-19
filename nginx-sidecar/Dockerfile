FROM amazon/aws-cli AS builder

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_SESSION_TOKEN

ARG CERTIFICATES_BUCKET
ARG CERTIFICATE_NAME
ARG CERTIFICATE_KEY_NAME

WORKDIR /certs
RUN aws s3 cp s3://${CERTIFICATES_BUCKET}/${CERTIFICATE_NAME} .
RUN aws s3 cp s3://${CERTIFICATES_BUCKET}/${CERTIFICATE_KEY_NAME} .

FROM nginx:stable-alpine

COPY --from=builder /certs /etc/nginx/certs
COPY ./nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx

ARG CERTIFICATE_NAME
ARG CERTIFICATE_KEY_NAME
ENV CERTIFICATE_NAME=$CERTIFICATE_NAME \
    CERTIFICATE_KEY_NAME=$CERTIFICATE_KEY_NAME

USER nginx

CMD /bin/sh -c "envsubst '$PARAMS' < /etc/nginx/nginx.conf.tmpl > /etc/nginx/nginx.conf \
    && nginx -g 'daemon off;' \
    || cat /etc/nginx/nginx.conf"
