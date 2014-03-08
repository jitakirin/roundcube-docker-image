# roundcube

## About

A [Roundcube](http://roundcube.net/) image.

Based on Ubuntu Saucy (13.10) and built using the roundcube package in universe
repo (0.9.2).  Uses sqlite3 database.

Served using Apache over SSL (exposes port 443), using a self-signed
certificate.

## Usage

Using the image as-is is possible (it should be able to connect to any IMAP
server specified on the login screen), e.g.:

    docker run -P FOO/roundcube:u1310

You'll most likely want to create your own derived image and at least configure
SMTP so you are also able to send emails.  You may also want to modify
`/etc/roundcube/main.inc.php` and e.g. pre-configure your IMAP server URL.
