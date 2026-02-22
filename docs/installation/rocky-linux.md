---
title: Self-Hosted on Rocky Linux
sidebar_position: 4
---

# Self‐Hosted on RockyLinux

The purpose of this page is to provide the requirements and steps needed to install/run ChurchCRM on a self-hosted Linux machine running RockyLinux (currently v8.9).

## Prerequisites

* mariadb-server
* httpd (apache web server)
* php8
* npm (if running from git clone)

## Suggested install commands

```sh
sudo dnf install httpd mariadb mariadb-server
```

## PHP Installation

It may be possible to run with the stock RockyLinux php packages, but it seems to be easier to use modular packages from the remi repository, and instructions for this are provided below:

> To enable the needed remi repository, see: [Adding Extra RockyLinux Repositories](Adding-Extra-RockyLinux-Repositories)

```sh
sudo dnf module reset php
sudo dnf module enable php:remi-8.2
sudo dnf install php php-cli php-fpm php-mysqlnd php-zip php-curl php-gd
sudo dnf module enable composer:remi:2
sudo dnf install composer
```

## Configure MariaDB

* Edit `/etc/my.cnf.d/mariadb-server.cnf` if desired to change db file location
* Start mariadb:  `sudo systemctl start mariadb`
* Secure the setup, and set a root password:  `sudo mysql_secure_installation`
* Create the churchcrm database: `mysqladmin -u root -p create churchcrm`
* Then create the churchcrm user and set a password for that user `mysql -u root -p`:

  ```sql
  CREATE USER 'churchcrm'@'localhost' IDENTIFIED BY 'YourDBPasswordHere';
  GRANT ALL PRIVILEGES ON churchcrm.* TO 'churchcrm'@'localhost';
  FLUSH PRIVILEGES;
  ```

## Configure Apache httpd

* Assuming that churchcrm may not be the only service on the web server, you should make a custom VirtualHost for churchcrm.
* An example is given here, which should be placed in `/etc/httpd/conf.d` directory, named `churchcrm.conf`:

```apache_conf
<VirtualHost *:8081>
  DocumentRoot /var/www/html
  <LocationMatch "/fpm-status">
      ProxyPass unix:/run/php-fpm/www.sock|fcgi://localhost
  </LocationMatch>
  <Directory /var/www/html>
      AllowOverride All
  </Directory>
</VirtualHost>
```

* The AllowOverride All is needed to ensure `.htaccess` rewrite requests are honored
* You need to make sure that the `httpd` and `php-fpm` are enabled and running:

```sh
sudo systemctl enable --now php-fpm
sudo systmctl enable --now httpd
```

## Different Run-time Options

### Running from source (i.e. development, running from a git repository)

* Note these steps are *not* necessary if running from a released zip file, as the results of this steps are already included in the zip.
* Once the OS packages are installed, the following steps are used from a clean `git pull` on master
  * `composer install`  (from src dir)
  * `composer --dev install` (from src dir, to install needed dev tools)
  * `npm install`
  * `npm run deploy`

### Running from a Downloaded Release Artifact

Download the latest release from [GitHub Releases](https://github.com/ChurchCRM/CRM/releases/latest) (e.g. `ChurchCRM-6.0.0.zip` or newer).

* This zip file contains a churchcrm top-level dir and will need to be unzipped in an appropriate area within your web server's Document root.
* For this example we will put it in `/var/www/html` and expect to access that churchcrm subdirectory at: [https://YourSiteName/churchcrm](https://YourSiteName/churchcrm)
* Run the following commands (replace `ChurchCRM-X.Y.Z.zip` with the actual file you downloaded):

```sh
sudo mkdir /var/www/html/churchcrm
sudo unzip -d /var/www/html ChurchCRM-X.Y.Z.zip
sudo chown -R apache:apache /var/www/html/churchcrm
```

## Initial Setup

Once the above steps have been completed, and you have:

1. A running database with a churchcrm account, and a known password
2. A working apache web server with mod_rewrite enabled

You should then be able to go to: [https://YourSiteName/churchcrm](https://YourSiteName/churchcrm) and you should be directed to a setup page that lets you begin configuration of the application.
