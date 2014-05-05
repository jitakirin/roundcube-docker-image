#!/bin/bash

set -e


function main() {
    configure
    serve
}

function configure() {
    if [[ -n $ROUNDCUBE_CONFIG_URL ]]; then
	curl -o /etc/roundcube/main.inc.php $ROUNDCUBE_CONFIG_URL
    fi
    if [[ -n $TZ ]]; then
	echo "date.timezone = $TZ" > /etc/php5/mods-available/timezone.ini
	php5enmod timezone
    fi
}

function serve() {
    # Make docker stop work correctly by ensuring signals get to apache2
    # process and avoid trying to change limits which produces errors under
    # docker.
    export APACHE_HTTPD="exec /usr/sbin/apache2" APACHE_ULIMIT_MAX_FILES=:
    exec /usr/sbin/apache2ctl -D FOREGROUND
}


main
