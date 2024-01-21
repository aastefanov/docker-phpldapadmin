FROM docker.io/library/debian:12-slim
LABEL maintainer="aastefanov@outlook.com"

WORKDIR /
COPY --chmod=755 startup.sh /

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install phpldapadmin

RUN mkdir -p /orig/templates
RUN cp -a /etc/phpldapadmin/templates/* /orig/templates/
RUN cp -a /etc/phpldapadmin/config.php /orig/
RUN cp -a /etc/phpldapadmin/apache.conf /orig/

VOLUME /etc/phpldapadmin


EXPOSE 80
CMD ["/bin/bash","-c","/startup.sh"]
