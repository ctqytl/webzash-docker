#!/bin/sh

set -e

# Disable test suite
$(rm /var/www/webzash/app/webroot/test.php 2> /dev/null) || true;

php-fpm
# Enable nginx to access php-fpm socket
chown nginx:nginx /var/run/php5-fpm.sock

nginx -g "daemon off;"
