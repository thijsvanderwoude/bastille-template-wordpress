# bastille-template-wordpress
Improved (for me) Bastille template to bootstrap WordPress into a Bastille jail.

Let me know if you have a problem by creating an issue, I'll try to fix it.

## Changes
These are some of the changes I've made.

### WordPress
- WordPress now accesses the database through a Unix socket instead of a TCP socket.
- WordPress database credentials are now in line with the standard wp-config.php.

### Nginx
- Tuned nginx for gzip compression by default.

### Packages
- Added git.
- Removed wordpress package. Instead it installs wp-cli, and through wp-cli it downloads WordPress and creates the database.
- Added bash. The install script also installs wp-autocompletion.bash.

## Bootstrap
```shell
bastille bootstrap https://github.com/thijsvanderwoude/bastille-template-wordpress
```

## Usage
```shell
bastille template TARGET thijsvanderwoude/bastille-wordpress-template
```
Then, inside of jail, in the /usr/local/www/wordpress directory you have to run:
```shell
wp core install --url=<url> --title="<site-title>" --admin_user=<username> --admin_password=<password> --admin_email=<email>
```

And update the salts as told in wp-config.php.

## Credits
- Christer Edwards for Bastille and this template.
- Barry McCormick for this template.
