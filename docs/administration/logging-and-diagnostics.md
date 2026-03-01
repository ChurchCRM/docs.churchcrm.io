---
title: Logging & Diagnostics
sidebar_position: 14
---

# Logging and Diagnostics

## 1. Background

We receive support requests via [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) and [GitHub Issues](https://github.com/ChurchCRM/CRM/issues). However, we can only offer generic assistance unless we are provided with some details specific to *your* setup. There are literally hundreds of different ways to host ChurchCRM from dedicated hardware, virtual machines, shared hosting or containerized setups. How we support you and what we might suggest is heavily dependent on how you have deployed ChurchCRM.

This page describes what information we need, and how to get it, when you ask for support.

## 2. Your setup

Please let us know the following about your ChurchCRM setup:

* Are you running on bare metal? (dedicated physical hardware)
* Shared hosting: which provider, and is it using cPanel or something else?
* Virtual machine hosting.
* Containerized hosting: Docker etc, something else?

In all setups as much of the following information as possible:

* Operating system:
  * **Windows** - Docker Desktop
  * **Linux** - distribution/version/etc
  * **MacOS** - version/MAMP/Homebrew
* Web server:
  * **Apache** (or **nginx** if used) — how it is deployed (vhost, subdirectory, etc.).
  * **PHP** — version, configuration, and installed extensions. A [PHP `phpinfo()`](https://www.php.net/manual/en/function.phpinfo.php) page can help.
* MySQL/MariaDB:
  * Version and configuration. Is it co-hosted on the same machine as the webserver or is it on a different machine?
* File System Permissions:
  * Please [verify your file permissions](/administration/file-system-permissions). Incorrect permissions cause many support requests and are easy to fix.

## 3. Logs

Logs are your friend, and consequently, OUR friend too! We really need to see what is happening "*under the hood*".

### 3.1 ChurchCRM Logs

Thankfully, ChurchCRM has a number of logs we can use to help which are in the `logs` directory where you deployed it. For example, if you deployed ChurchCRM at `/var/www/vhosts/churchcrm` then the `logs` directory will be `/var/www/vhosts/churchcrm/logs`. In that directory, ChurchCRM will write three different logs grouped by days:

1. `yyyy-mm-dd-auth.log` - authentication log: tracking user access and failed access attempts etc.
2. `yyyy-mm-dd-app.log` - application log: with internal events and basic debugging information (this is the log we usually need to see).
3. `yyyy-mm-dd-orm.log` - ORM logs: not usually stuff we would ask for, but if we do, we will ask for the "ORM logs".

#### 3.1.1 Viewing Logs Via Admin UI

System administrators can view, filter, and manage logs directly from the ChurchCRM admin interface:

1. Log in to ChurchCRM as an administrator
2. Go to **Admin** → **System Logs**
3. In the **Log Settings** section, you can adjust the log level (DEBUG, INFO, NOTICE, WARNING, ERROR, CRITICAL, ALERT, EMERGENCY)
4. In the **System Logs** section, you can:
   - **View** any log file by clicking the eye icon - this opens a modal where you can filter by log level and view specific entries
   - **Delete** individual log files by clicking the trash icon
   - **Delete All Logs** using the red button (if logs are present)
   - **Adjust the log level** to control the verbosity of future log entries

**Note:** Lower numbers log more details (DEBUG = 100), while higher numbers only log severe issues (EMERGENCY = 600). Changes to the log level apply to new log entries immediately.

#### 3.1.2 Accessing Logs Directly From the File System

You can also access logs directly from the file system if you have SSH access or file manager access to your server. If you deployed ChurchCRM at `/var/www/vhosts/churchcrm`, the logs are stored at `/var/www/vhosts/churchcrm/logs`. You can download them using SFTP, SCP, or a file manager provided by your hosting provider.

### 3.2 Apache Logs

Apache logs its own messages and developers will sometimes ask for the **Apache error log**. Where this log is entirely dependent on the way Apache is configured.

**Self-Hosted / VPS (SSH):**
Generally speaking, if you are self-hosting or running on a virtual machine, look under `/var/log/`:
```bash
# Apache error log (common locations)
tail -100 /var/log/apache2/error_log     # Debian/Ubuntu
tail -100 /var/log/httpd/error_log       # CentOS/RHEL
# Search for errors
grep ERROR /var/log/apache2/error_log
```

**Shared Hosting (cPanel):**
Shared hosting providers sometimes hide Apache error logs:
1. Log in to **cPanel**
2. Look for **Error Log** (usually in Main section, or search for "Error Log")
3. Download or view the current error log
4. If you can't find it, contact your hosting provider's support

**Docker:**
See [Docker Development Environment](Docker) for details on viewing container logs.

**Tip:** When reporting an issue, if your ChurchCRM logs don't show the problem, an Apache error log is often very helpful for diagnosis.

## 4. Sharing Logs With Developers

Logs can contain sensitive information or information you want to hide (IP addresses, usernames, hostnames, domains, etc). If you choose to redact your logs please make it obvious what information you have replaced and please be consistent. For instance here is a raw log, and a redacted log (*although they have been formatted for clarity*):

### Raw Log

```log
[2021-07-09T21:29:41.473127+10:00] authLogger.INFO: User partially authenticated, pending 2FA:
    jbloggs [] {
        "url":"/session/begin",
        "remote_ip":"111.222.333.444",
        "correlation_id":"60e8332573831",
        "context":{
            "ContextClass":"ChurchCRM\\Authentication\\AuthenticationManager",
            "ContextMethod":"Authenticate"
         }
    }
```

### Redacted Log

```log
[2021-07-09T21:29:41.473127+10:00] authLogger.INFO: User partially authenticated, pending 2FA:
    username [] {
        "url":"/session/begin",
        "remote_ip":"Remote.IP.Redacted",
        "correlation_id":"60e8332573831",
        "context":{
            "ContextClass":"ChurchCRM\\Authentication\\AuthenticationManager",
            "ContextMethod":"Authenticate"
         }
    }
```

**Notice** the user name consistently replaced `jbloggs` with `username` and the remote IP address consistently replaced `111.222.333.444` with `Remote.IP.Redacted`.

### 4.1 Some do's and don'ts

#### DO

* If you redact your logs, please be consistent with what you replace. Replacing different details with same "redacted" comment renders your logs useless.
* Wrap logs in triple back-ticks *(on their own line)*, in both [GitHub Issues](https://github.com/ChurchCRM/CRM/issues) and [Gitter chats](https://gitter.im/ChurchCRM/CRM), e.g.:

  ````text
  ```
  Those triple back-ticks need to be on a line by themselves.
  This is my log
  ```
  ````

* Be aware with shared hosting or remote hosting, your webserver may be in a different time zone - please supply the logs covering the time you encountered a problem as recorded by your web server. This may be different to "local time".
* Feel free to format your logs for clarity (*see examples above*).

#### DON'T

* Assume we know what you are seeing purely because of the log. Describe the behavior you experience including what you did to create it.
* Screenshots are great, but *don't screenshot your logs* - they are hard to read and we can't search them for specific strings etc.

## 5. Log All The Things

The default logging is usually sufficient to identify most problems we are asked about. However, you may be be asked to do one or more of the following...

### 5.1 Coaxing SLIM to display the real error

Described [here](https://www.slimframework.com/docs/v3/handlers/error.html), remove the keys from the slim `$app`:

```php
unset($app->getContainer()['errorHandler']);
unset($app->getContainer()['phpErrorHandler']);
```

### 5.2 Configure the Bootstrapper debug mode

In `Include/Config.php`, set `$debugBootstrapper = true;`. If the variable is not already present in `Config.php`, you should add it.

This will cause the bootstrapper to write verbose logs as it sets up the environment.

The resulting debug log entries are written to the current date's app log (e.g. `yyyy-mm-dd-app.log`). See [ChurchCRM Logs](#31-churchcrm-logs) above.

To revert this debug behavior, set `$debugBootstrapper = false;`
