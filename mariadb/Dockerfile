FROM alpine:3.22

RUN apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/lib/mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY --chmod=+x entrypoint.sh /entrypoint.sh

RUN sed -i "s|skip-networking|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

USER mysql

ENTRYPOINT ["/entrypoint.sh"]
