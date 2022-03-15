# bastille-template-wordpress
Improved (for me) Bastille template to bootstrap WordPress into a Bastille jail.

## Changes
These are some of the changes I've made.
- WordPress now accesses the database through a Unix socket instead of a TCP socket.
- WordPress database credentials are now in line with the standard wp-config.php.
- 
- Removed wordpress package, instead it installs wp-cli, and through wp-cli it automatically installs WordPress.
- Add bash and .bash_profile for easier maintenance with wp-autocompletion.bash.

## Bootstrap
```shell
bastille bootstrap https://gitlab.com/bastillebsd-templates/wordpress
```

## Usage
```shell
bastille template TARGET bastillebsd-templates/wordpress
```

## Credits
- Christer Edwards for Bastille and this template.
- Barry McCormick for this template.
