#!/bin/sh

set -e

# Disable test suite
rm /var/www/webzash/app/webroot/test.php

php-fpm
# Enable nginx to access php-fpm socket
chown nginx:nginx /var/run/php5-fpm.sock

nginx -g "daemon off;"
