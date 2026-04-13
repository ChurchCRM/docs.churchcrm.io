---
title: Self-Hosted on Ubuntu / Debian
sidebar_position: 5
---

# Self-Hosted on Ubuntu / Debian

Step-by-step installation of ChurchCRM on Ubuntu 22.04 LTS or 24.04 LTS (and compatible Debian-based systems). For Rocky Linux / RHEL, see [Self-Hosted on Rocky Linux](/installation/rocky-linux).

---

## 1. Install system packages

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y apache2 mariadb-server unzip wget
```

Enable and start services:

```sh
sudo systemctl enable --now apache2
sudo systemctl enable --now mariadb
```

Allow HTTP through the firewall:

```sh
sudo ufw allow in "Apache Full"
```

## 2. Install PHP 8.4

Ubuntu 22.04's default PHP is 8.1; Ubuntu 24.04 ships 8.3. Use the Ondřej Surý PPA for the current recommended version:

```sh
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

sudo apt install -y php8.4 php8.4-cli php8.4-fpm php8.4-mysql \
     php8.4-zip php8.4-curl php8.4-gd php8.4-bcmath \
     php8.4-intl php8.4-mbstring php8.4-xml libapache2-mod-php8.4
```

:::tip PHP extensions
All extensions in that `apt install` line are required. The app validates them at every page load.
:::

Enable the PHP module and disable older versions if present:

```sh
sudo a2enmod php8.4
# If an older version was active:
# sudo a2dismod php8.1 php8.3
sudo systemctl restart apache2
```

## 3. Configure MariaDB

```sh
sudo mysql_secure_installation
```

Then create the database and user:

```sh
sudo mysql -u root
```

```sql
CREATE DATABASE churchcrm CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'churchcrm'@'localhost' IDENTIFIED BY 'YourDBPasswordHere';
GRANT ALL PRIVILEGES ON churchcrm.* TO 'churchcrm'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

## 4. Configure Apache

Enable mod_rewrite (required):

```sh
sudo a2enmod rewrite
sudo systemctl restart apache2
```

Create `/etc/apache2/sites-available/churchcrm.conf`:

```apacheconf
<VirtualHost *:80>
  ServerName your-server-hostname
  DocumentRoot /var/www/html

  <Directory /var/www/html/churchcrm>
    AllowOverride All
    Require all granted
  </Directory>
</VirtualHost>
```

Enable the site:

```sh
sudo a2ensite churchcrm.conf
sudo a2dissite 000-default.conf   # optional: disable the default site
sudo systemctl reload apache2
```

## 5. Install ChurchCRM

```sh
cd /var/www/html
sudo wget https://github.com/ChurchCRM/CRM/releases/latest/download/ChurchCRM-latest.zip
sudo unzip ChurchCRM-latest.zip
sudo chown -R www-data:www-data churchcrm
```

:::tip File permissions
See [File System Permissions](/administration/file-system-permissions) if the app shows permission warnings after install.
:::

## 6. Open in your browser

Navigate to `http://your-server/churchcrm`. The first-run setup wizard will appear. See [First Run Configuration](/getting-started/first-run) for what to expect.

---

## Performance tuning

For large data operations (imports, backups) the default PHP execution time may not be enough:

```sh
# /etc/php/8.4/apache2/php.ini
max_execution_time = 300
```

Restart Apache after changing `php.ini`: `sudo systemctl restart apache2`

---

## Troubleshooting

### mod_rewrite shows as failed on the prerequisites page

If the app's prerequisites page shows mod_rewrite as failed even though `a2enmod rewrite` was run, check that your `<Directory>` block has `AllowOverride All` (not `AllowOverride None`, which is the Ubuntu Apache default). Reload Apache after changing it.

### 500 error immediately after install

Check the Apache error log:

```sh
sudo tail -50 /var/log/apache2/error.log
```

The most common causes are:
- Missing PHP extensions (`php8.4-bcmath`, `php8.4-xml`, etc.)
- Wrong file ownership (`chown -R www-data:www-data churchcrm`)
- mod_rewrite not enabled

---

## See Also

- [Rocky Linux Installation](/installation/rocky-linux) — RHEL/Rocky Linux
- [SSL / HTTPS](/installation/ssl-https) — Strongly recommended before going live
- [System Requirements](/installation/system-requirements) — Full PHP and DB requirements
- [First Run Configuration](/getting-started/first-run) — Initial setup after install
