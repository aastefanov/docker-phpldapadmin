FROM alpine:latest AS builder

RUN apk add --no-cache wget tar
RUN wget -O /phpldapadmin.tar.gz https://github.com/leenooks/phpLDAPadmin/archive/refs/tags/1.2.6.7.tar.gz

WORKDIR /src

RUN tar -zxf /phpldapadmin.tar.gz -C /
RUN mv /phpLDAPadmin-1.2.6.7/* /src/


FROM php:7-apache AS runner

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
	install-php-extensions gettext ldap

COPY --from=builder /src /var/www/html
RUN chown -R 0:33 /var/www/html
RUN chmod -R u+rw,g+r /var/www/html

VOLUME /var/www/html/config
