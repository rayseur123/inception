FROM alpine:3.23

RUN apk add --no-cache lighttpd php gcgi php-cgi

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

