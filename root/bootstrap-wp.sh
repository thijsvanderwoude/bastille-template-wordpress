#!/bin/sh
# (christer.edwards@gmail.com)
# bootstrap wordpress database and token

## Set bash as standard shell.
chsh -s /usr/local/bin/bash root

## Install wp-cli.
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Install wp-cli autocompletion. MIGHT NEED UPDATING PER WP-CLI VERSION!
curl https://raw.githubusercontent.com/wp-cli/wp-cli/v2.6.0/utils/wp-completion.bash > /root/wp-completion.bash
echo -e "source /root/wp-completion.bash\nalias wp=\"wp --allow-root\""

## Download latest version of WordPress.
wp --allow-root core download --path=/usr/local/www/wordpress

cd /usr/local/www/wordpress

## set random token string
BOOTSTRAP_TOKEN=$(openssl rand -hex 18)

# Create wp-config.php.
wp --allow-root config create \
--dbname=wordpress \
--dbuser=wp_user \
--dbpass=$BOOTSTRAP_TOKEN \
--dbhost=localhost:/var/run/mysql/mysql.sock

## Create database.
wp --allow-root db create

## Notify that the salts should still be done and the install finalized.
echo '!!! IMPORTANT: you should set the salts as shown in wp-config.php!'
echo '!!! IMPORTANT: run:'
echo 'wp core install --url=<url> --title="<site-title>" --admin_user=<username> --admin_password=<password> --admin_email=<email>'
echo 'to finalize installation.'

## cleanup
rm /root/bootstrap-wp.sh
