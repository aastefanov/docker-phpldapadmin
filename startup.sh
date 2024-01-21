#!/bin/bash

if [ ! -f /etc/phpldapadmin/config.php ]; then
	cp -a /orig/config.php /etc/phpldapadmin/
fi

if [ ! -d /etc/phpldapadmin/apache.conf ]; then
	cp -a /orig/apache.conf /etc/phpldapadmin/
fi

if [ ! -d /etc/phpldapadmin/templates ]; then
	cp -a /orig/templates /etc/phpldapadmin/
fi

apachectl -D FOREGROUND
