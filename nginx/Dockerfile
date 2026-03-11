FROM alpine:3.22.3

RUN apk add --no-cache nginx openssl && mkdir -p /etc/nginx/ssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY --chmod=+x entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
