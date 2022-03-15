# bastille-template-wordpress
Improved (for me) Bastille template to bootstrap Wordpress into a Bastille jail.

## Changes
These are some of the changes I've made.
- Removed wordpress package, instead it installs wp-cli, and through wp-cli it automatically installs WordPress.
- Add bash and .bashrc for easier maintenance.

## Bootstrap
```shell
bastille bootstrap https://gitlab.com/bastillebsd-templates/wordpress
```

## Usage
```shell
bastille template TARGET bastillebsd-templates/wordpress
```
