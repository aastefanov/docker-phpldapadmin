FROM docker.io/library/debian:12-slim
LABEL maintainer="aastefanov@outlook.com"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install phpldapadmin

EXPOSE 80
CMD apachectl -D FOREGROUND
