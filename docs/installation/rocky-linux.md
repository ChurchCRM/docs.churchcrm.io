---
title: Self-Hosted on Rocky Linux
sidebar_position: 4
---

# Self-Hosted on Rocky Linux

Step-by-step installation of ChurchCRM on Rocky Linux (tested on 8.x and 9.x). For Ubuntu/Debian, see [Self-Hosted on Ubuntu](/installation/ubuntu).

---

## 1. Install system packages

```sh
sudo dnf install httpd mariadb mariadb-server unzip
sudo systemctl enable --now mariadb
sudo systemctl enable --now httpd
```

## 2. Install PHP 8.4

Rocky Linux's default PHP is too old. Use the Remi repository:

```sh
# Enable EPEL and Remi repos
sudo dnf install epel-release
sudo dnf install https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E %rhel).rpm

# Switch to PHP 8.4
sudo dnf module reset php
sudo dnf module enable php:remi-8.4
sudo dnf install php php-cli php-fpm php-mysqlnd php-zip php-curl php-gd \
     php-bcmath php-intl php-mbstring php-xml
```

:::tip PHP extensions
All extensions in that last `dnf install` line are required. The app validates them at every page load and will display a warning if any are missing.
:::

## 3. Configure MariaDB

```sh
sudo mysql_secure_installation
```

Then create the database and user:

```sh
mysqladmin -u root -p create churchcrm
mysql -u root -p
```

```sql
CREATE USER 'churchcrm'@'localhost' IDENTIFIED BY 'YourDBPasswordHere';
GRANT ALL PRIVILEGES ON churchcrm.* TO 'churchcrm'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

## 4. Configure Apache

Create `/etc/httpd/conf.d/churchcrm.conf`:

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

`AllowOverride All` is required so that ChurchCRM's `.htaccess` routing rules take effect.

Make sure both services are running:

```sh
sudo systemctl enable --now php-fpm
sudo systemctl enable --now httpd
```

## 5. Install ChurchCRM

Download the latest release:

```sh
cd /var/www/html
sudo wget https://github.com/ChurchCRM/CRM/releases/latest/download/ChurchCRM-latest.zip
sudo unzip ChurchCRM-latest.zip
sudo chown -R apache:apache churchcrm
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
# /etc/php.ini
max_execution_time = 300
```

Restart Apache after changing `php.ini`: `sudo systemctl restart httpd`

---

## Firewall

If you have `firewalld` enabled, open HTTP (and HTTPS if you've set up SSL):

```sh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

---

## See Also

- [Ubuntu Installation](/installation/ubuntu) — Debian/Ubuntu-based systems
- [SSL / HTTPS](/installation/ssl-https) — Strongly recommended before going live
- [System Requirements](/installation/system-requirements) — Full PHP and DB requirements
- [First Run Configuration](/getting-started/first-run) — Initial setup after install
