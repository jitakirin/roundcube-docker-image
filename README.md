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

    docker run -P jitakizushi/roundcube:u1310

You can also specify a roundcube config file (`main.inc.php`) to use by
specifying a URL to download it from:

    docker run -P -e ROUNDCUBE_CONFIG_URL=http://foo/main.inc.php \
        jitakizushi/roundcube:u1310

You'll need to do that to be able to send emails (you need to configure SMTP
server in `main.inc.php`).
