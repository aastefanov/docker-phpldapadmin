FROM docker.io/library/debian:12-slim
LABEL maintainer="aastefanov@outlook.com"

WORKDIR /
COPY startup.sh /
RUN chmod +x /startup.sh

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install phpldapadmin

RUN cp -r /etc/phpldapadmin/templates/ /
RUN cp /etc/phpldapadmin/config.php /
RUN cp /etc/phpldapadmin/apache.conf /

VOLUME /etc/phpldapadmin


EXPOSE 80
CMD ["/bin/bash","-c","/startup.sh"]
