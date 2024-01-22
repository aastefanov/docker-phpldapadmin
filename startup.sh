#!/bin/sh
set -e

if [ ! -f /etc/phpldapadmin/config.php ]; then
	cp -a /orig/config.php /etc/phpldapadmin/
fi

if [ ! -f /etc/phpldapadmin/apache.conf ]; then
	cp -a /orig/apache.conf /etc/phpldapadmin/
fi

if [ ! -d /etc/phpldapadmin/templates ]; then
	cp -a /orig/templates /etc/phpldapadmin/
fi

chown -R 0:33 /etc/phpldapadmin

exec "$@"
