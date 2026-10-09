---
title: Azure Cloud Setup
sidebar_position: 6
---

# Install ChurchCRM on Azure

This installs ChurchCRM on an Ubuntu virtual machine in Microsoft Azure. The app requirements are the same as any other server: see [System Requirements](/installation/system-requirements). For the package steps on Ubuntu without the Azure portal, see [Self-Hosted on Ubuntu / Debian](/installation/ubuntu).

## 1. Create the virtual machine

1. In the [Azure portal](https://portal.azure.com), open **Virtual machines** and click **Create** → **Azure virtual machine**.
2. Choose a resource group, and name the VM (these steps use `LAMPServer`).
3. **Image:** Ubuntu Server 24.04 LTS.
4. **Size:** a general-purpose size with at least 2 GB of RAM. ChurchCRM needs a PHP `memory_limit` of 256MB, and the OS needs memory of its own.
5. **Authentication:** an SSH public key, or a password. Save the username and the key or password. These steps use the username `lamp`.
6. **Inbound ports:** allow **SSH (22)**. Leave HTTP closed until the stack is installed.
7. **Disk:** the default OS disk is enough to start (ChurchCRM itself needs about 500MB, plus room for photos and backups).
8. Click **Review + create**, then **Create**.

When the VM is running, open it and copy the **Public IP address**.

## 2. Sign in

From your computer:

```sh
ssh lamp@YOUR_PUBLIC_IP
```

Use the username from step 1. If you chose a password, the client prompts for it. If you chose an SSH key, point the client at that key (`ssh -i /path/to/key lamp@YOUR_PUBLIC_IP`).

## 3. Install Apache, MariaDB, and PHP 8.4

Ubuntu 24.04 ships PHP 8.3. ChurchCRM requires PHP 8.4 or newer, so install PHP from the Ondřej Surý PPA:

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y apache2 mariadb-server unzip wget software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.4 php8.4-cli php8.4-mysql \
     php8.4-zip php8.4-curl php8.4-gd php8.4-bcmath \
     php8.4-intl php8.4-mbstring php8.4-xml libapache2-mod-php8.4
sudo a2enmod php8.4 rewrite
sudo systemctl enable --now apache2 mariadb
```

Those PHP packages cover the extensions ChurchCRM checks at setup (mysqli, curl, gd, mbstring, xml, zip, bcmath, intl, and the extensions bundled with PHP itself, including gettext and fileinfo).

Set the PHP memory limit to at least 256MB. Open the Apache `php.ini`:

```sh
sudo nano /etc/php/8.4/apache2/php.ini
```

Find `memory_limit` and set:

```ini
memory_limit = 256M
```

For photo and backup uploads, also raise the upload limits (both must be at least as large as the biggest file you will upload):

```ini
upload_max_filesize = 32M
post_max_size = 32M
```

Save the file, then:

```sh
sudo systemctl restart apache2
```

## 4. Create the database

```sh
sudo mysql
```

```sql
CREATE DATABASE churchcrm CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'churchcrm'@'localhost' IDENTIFIED BY 'YourDBPasswordHere';
GRANT ALL PRIVILEGES ON churchcrm.* TO 'churchcrm'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Use a real password in place of `YourDBPasswordHere`.

## 5. Let Apache read ChurchCRM's `.htaccess`

ChurchCRM needs `mod_rewrite` and `AllowOverride All`.

```sh
sudo nano /etc/apache2/apache2.conf
```

Find the block for `/var/www/` and change `AllowOverride None` to `AllowOverride All`:

```apacheconf
<Directory /var/www/>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```

Save, then:

```sh
sudo rm -f /var/www/html/index.html
sudo systemctl reload apache2
```

## 6. Install ChurchCRM

```sh
cd /tmp
wget https://github.com/ChurchCRM/CRM/releases/latest/download/ChurchCRM-latest.zip
unzip ChurchCRM-latest.zip
sudo rsync -a churchcrm/ /var/www/html/
sudo chown -R www-data:www-data /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;
```

`Include/` and `Images/` (including `Images/Family` and `Images/Person`) must stay writable by `www-data`. The `chown` above does that. If setup later reports a permission failure, see [File System Permissions](/administration/file-system-permissions).

## 7. Open HTTP in Azure

1. In the portal, open the VM → **Networking**.
2. Click **Create port rule** / **Add inbound port rule**.
3. Allow inbound **TCP 80** from the internet (service **HTTP**). Name it something like `HTTP_in` and save.

Do not open MySQL (3306) to the internet. The database user above is `localhost` only.

Outbound internet access is already allowed on a new Azure VM. The server needs it to download the zip and, later, to check for upgrades.

## 8. Run the setup wizard

1. In a browser, open `http://YOUR_PUBLIC_IP`.
2. ChurchCRM shows the setup wizard. Fix any prerequisite it marks as failed before continuing (PHP version, extensions, or a directory that is not writable).
3. On **Connect Your Database**, use:
   - Server: `localhost`
   - Database: `churchcrm`
   - User: `churchcrm`
   - Password: the password from step 4
4. Finish the wizard. When it says **Installation Complete**, sign in:
   - Username: `admin`
   - Password: `changeme`
5. ChurchCRM sends you to **Change Password**. Enter `changeme` as the old password and choose a new one.
6. You are then sent to **Admin → Church Information**. Fill in the church name and the other required fields, then click **Save Church Information**.

Continue with [First Run Configuration](/getting-started/first-run).

## 9. HTTPS

A public church site should not stay on plain HTTP. Point a DNS name at the VM's public IP, open inbound **TCP 443**, and follow [SSL / HTTPS](/installation/ssl-https).

To send mail, configure SMTP under **Admin → System Settings → Email**. That is an outbound connection from the VM to your mail host (often port 587). You do not need an inbound mail rule on the VM.
