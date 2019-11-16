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
sed -i.orig s#database_name_here#wordpress# /usr/local/www/wordpress/wp-config.php

echo "This template uses a randomly generated hex string"
echo "The lines below should match and use this generated string"
echo
echo "wp-config.php:"
grep $BOOTSTRAP_TOKEN /usr/local/www/wordpress/wp-config.php
echo "database password:"
grep $BOOTSTRAP_TOKEN /root/wordpress.sql
echo

## import database
mysql < /root/wordpress.sql

## cleanup
rm /root/wordpress.sql
rm /root/wordpress.sql.orig
rm /usr/local/www/wordpress/wp-config.php.orig
rm /root/bootstrap-wp.sh
