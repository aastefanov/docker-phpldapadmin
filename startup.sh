#!/bin/bash

if [ ! -f /etc/phpldapadmin/config.php ]; then
	cp /config.php /etc/phpldapadmin/
fi

if [ ! -d /etc/phpldapadmin/apache.conf ]; then
	cp /apache.conf /etc/phpldapadmin/
fi

if [ ! -d /etc/phpldapadmin/templates ]; then
	cp -r /templates /etc/phpldapadmin/
fi

apachectl -D FOREGROUND
