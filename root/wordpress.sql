/*
This file used to bootstrap wordpress database.
It is deleted at template completion.
*/
CREATE DATABASE wordpress;
CREATE USER wpuser@localhost IDENTIFIED BY 'password_here';
GRANT ALL PRIVILEGES ON wordpress.* TO wpuser@localhost;
