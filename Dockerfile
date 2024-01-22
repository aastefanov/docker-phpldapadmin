FROM docker.io/library/debian:12-slim
LABEL maintainer="aastefanov@outlook.com"

WORKDIR /
COPY --chmod=755 startup.sh /

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install phpldapadmin && apt-get clean

RUN mkdir -p /orig/templates
RUN cp -a /etc/phpldapadmin/templates/* /orig/templates/
RUN cp -a /etc/phpldapadmin/config.php /orig/
RUN cp -a /etc/phpldapadmin/apache.conf /orig/

RUN sed -i "s,/var/www/html,/usr/share/phpldapadmin/htdocs,g" /etc/apache2/sites-enabled/000-default.conf

VOLUME /etc/phpldapadmin


EXPOSE 80
ENTRYPOINT ["/startup.sh"]
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
