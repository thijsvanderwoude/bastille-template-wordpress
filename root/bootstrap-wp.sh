#!/bin/sh
# (christer.edwards@gmail.com)
# bootstrap wordpress database and token

## set random token string
export BOOTSTRAP_TOKEN=$(openssl rand -hex 18)

## copy config sample into place
cp /usr/local/www/wordpress/wp-config-sample.php /usr/local/www/wordpress/wp-config.php

## find/replace magic
sed -i.orig s#password_here#$BOOTSTRAP_TOKEN# /root/wordpress.sql
sed -i.orig s#username_here#wpuser# /usr/local/www/wordpress/wp-config.php
sed -i.orig s#password_here#$BOOTSTRAP_TOKEN# /usr/local/www/wordpress/wp-config.php

echo "Two lines should display below"
grep $BOOTSTRAP_TOKEN /usr/local/www/wordpress/wp-config.php
grep $BOOTSTRAP_TOKEN /root/wordpress.sql
echo "Two lines should display above"

## import database
mysql < /root/wordpress.sql

## cleanup
rm /root/wordpress.sql{,.orig}
rm /root/bootstrap-wp.sh
rm /usr/local/www/wordpress/wp-config.php.orig

## validate nginx configuration
nginx -t
