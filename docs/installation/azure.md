---
title: Azure Cloud Setup
sidebar_position: 6
---

# Installing LAMP and ChurchCRM on Azure

1. On Azure
   1. Click Virtual Machines
   2. Click Create Virtual Machines
   3. Select Ubuntu Server
   4. Select Ubuntu Server 24.04 or latest version and click Create
    * Name: LAMPServer
    * VM disk type: SSD
    * User name: lamp
    * Authentication type: Password
    * Password: \*\*\*\*
    * Resource group: Create new: LAMPServer
    * Location: (whatever is best for you)
    * Click OK
    * Select a size that suits you
    * Click OK
    * Availability set: None
    * Use managed disks: Yes
    * Virtual network: leave as default
    * Subnet: leave as default
    * Public IP address: Static
    * Network security group (firewall): leave as default
    * Enable auto-shutdown: Off
    * Boot diagnostics: Enabled
    * Guest OS diagnostics: Disabled
    * Diagnostics storage account: leave as default
    * Click Create
   5. Click Virtual Machines
   6. Click LAMPServer
    * Take note of the Public IP address
2. Download and install an SSH client (I am using PuTTY)
   1. Enter the Public IP address under “Host Name (or IP address)”
   2. Click Open
   3. Click Yes on the prompt (First time only) and a terminal window will open
3. Login
   1. username: lamp
   2. Password: \*\*\*\*
4. Updates
   1. `sudo bash`
   2. `apt-get update`
   3. `apt-get -y upgrade`
   4. `apt-get -y dist-upgrade`
   5. `apt-get -y autoremove`
5. Configuring LAMP
   1. `apt-get -y install apache2`
   2. `apt-get -y install mysql-server`
   3. Enter _MySQLPassword_
   4. Confirm _MySQLPassword_
   5. `apt-get -y install php`
   6. `apt-get -y install php-curl php-cli php-dev php-gd php-intl
      php-mcrypt php-json php-mysql php-opcache php-bcmath
      php-mbstring php-soap php-xml php-zip gettext unzip`
6. Allow custom URLs
   1. `a2enmod rewrite`
7. Create a database
   1. `mysql -u root -p`
   2. Enter _MySQLPassword_
   3. `CREATE DATABASE churchcrm;`
   4. `CREATE USER 'churchcrm'@'localhost' IDENTIFIED BY
      'Put\_your\_database\_password\_here';`
   5. `GRANT ALL ON churchcrm.\* TO churchcrm@'localhost';`
   6. `exit;`
8. Edit `000-default.conf` file
   1. Hostname
    * Take note of your hostname
   2. `nano /etc/apache2/sites-available/000-default.conf`
    * Find “\#ServerName
          [www.example.com](http://www.example.com)”
    * Remove the \# and change `www.example.com` to the hostname (_See step #1_)
    * Find “`DocumentRoot /var/www/html`” and put a forward slash on
          the end so it looks like this: `DocumentRoot /var/www/html/`
   3. `CTRL+x` ; `Y` ; `Enter`
9. Edit hosts file
   1. `ifconfig`
    * Take note of your local IP address
   2. `nano /etc/hosts`
    * Under `127.0.0.1 localhost` put in your local IP address and
          hostname so it looks like this (yours might be different):

          ```

         ## Related Pages

         - [Prerequisites](How-to-Manually-Upgrade-ChurchCRM.md)

         ## Test the System Before Importing Real Data

         - Test the system by importing demo data: [Importing Demo Data via Admin Pages](Importing-Demo-Data.md)
          127.0.0.1 localhost
          10.0.0.4 LAMPServer
          ```

   3. `CTRL+x` ; `Y` ; `Enter`
10. Edit `apache2.conf` file
   1. `nano /etc/apache2/apache2.conf`
    * Find:

          ```
          <Directory /var/www/>
              Options Indexes FollowSymLinks
              AllowOverride None
              Require all granted
          </Directory>
          ```

    * Change `AllowOverride` from `None` to `All`
   2. `CTRL+x` ; `Y` ; `Enter`
11. Edit `php.ini` file
   1. `nano /etc/php/X.X/apache2/php.ini` (replace X.X with your PHP version)
    * Under "`[PHP];`"
    * Add: `register_globals=0;`
    * Find `memory_limit = 128M` and change it to `32M`
    * Find `upload_max_filesize = 2M` and change it to `24M`
    * Find `post_max_size = 8M` and change it to `32M`
   2. `CTRL+x` ; `Y` ; `Enter`
12. Remove `index.html`
   1. `rm /var/www/html/index.html`
13. Configure ChurchCRM (USE THIS VERSION!!!)
   1. `wget https://github.com/ChurchCRM/CRM/releases/download/2.9.4/ChurchCRM-2.9.4.zip`
   2. `unzip ChurchCRM-2.9.4.zip`
   3. `rsync -av churchcrm/ /var/www/html/`
   4. `chown -R www-data:www-data /var/www/html`
   5. `chmod -R 755 /var/www/html`
14. *RESTART* the virtual machine
15. On Azure
   1. Click Virtual Machines
   2. Click LAMPServer
   3. Click Networking
   4. Click Add inbound port rule
    * In the Service drop down select `HTTP`
    * Change the Name to `HTTP_in` and click OK
   5. Click Add outbound port rule
    * In the Service drop down select HTTP
    * Change the Name to `HTTP_out` and click OK
   6. Click Add outbound port rule
    * In the Service drop down select `SMTP`
    * Change the Name to `SMTP25_out` and click OK
   7. Click Add outbound port rule
    * In the Service drop down select `Custom`
    * Change the Port ranges to `587`
    * Change the Name to `SMTP587_out` and click OK
16. In your browser
   1. Enter your public IP address in the URL bar
    * You should be greeted with ChurchCRM’s setup page
   2. Click Next
   3. Click Next
   4. Click Next
   5. Database Server Name: `localhost`
   6. Database Name: `churchcrm`
   7. user: `churchcrm`
   8. password: \*\*\*\*
    * Your MySQL password
   9. Click Finish
17. On the login page
   1. Username: `Admin`
   2. Password: `changeme`
   3. Click Login
   4. Old Password: `changeme`
   5. New Password: \*\*\*\*
18. Update to the latest version
   1. Click the Tasks icon in top right corner and click new release
      ![Task Menu Icon](/img/Setup/admin-task-menu-1.png)
   2. follow the prompts
