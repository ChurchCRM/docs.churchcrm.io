---
title: 500 Error
sidebar_position: 13
---

When installing the ChurchCRM system on a hosting system sometimes you get the following message:

> Internal Server Error
>
> The server encountered an internal error or misconfiguration and was unable to complete your request.
>
> Please contact the server administrator at to inform them of the time this error occurred, and the actions you performed just before this error.
>
> More information about this error may be available in the server error log.
>
> Additionally, a 500 Internal Server Error error was encountered while trying to use an ErrorDocument to handle the request.

## Check File Permissions

By default, zip file do not have the correct file permissions. You will see something like this in the Apache `error.log`:

> [Sun Feb 23 22:49:48.185584 2020] [:error] [pid 946920:tid 47367069935360] [client xxx.yyy.zzz.123:0] SoftException in Application.cpp:267: File "/path/to/ChurchCRM/Menu.php" is writeable by group, referrer: https://yoursite.domain.example/Menu.php

> [!NOTE]
> Instead of `writeable by group` you might see `execute bit set`, etc.

Please see our [File-System-Permissions](./documentation on setting up permissions correctly) for details.

> [!WARNING]
> **DO NOT** set everything to mode 755 as some web server admins use a more restrictive security model (which is also becoming more common in default configurations too) that causes problems when PHP scripts have their execute bit set. This is *why* we recommend having files set **without** the execute bit. In even more restrictive setups, group-writable files/directories can cause 500 errors too (Bluehost customers on shared hosting - this is you... And probably other cPanel users on other hosting providers too).
 
[cPanel File Manager does not allow for recursive permission update...](https://stackoverflow.com/questions/36170381/change-change-mode-of-all-files-and-folders-in-cpanel-at-once) 

## Check cPanel Logs for Errors

cPanel should have a section to review your hosting errors. You can also check ChurchCRM logs by navigating to **Admin** → **System Logs** to view application, authentication, and ORM logs. See [Logging and Diagnostics](Logging-and-Diagnostics.md) for more details. 

## Check VM PHP Errors for issues

If you running your own VM system, the PHP logs will include Error, please review them.

## Coaxing SLIM to display the real error

Described under the [Slim Framework System Error Handler](https://www.slimframework.com/docs/v3/handlers/error.html), remove the keys from the slim `$app`:

```php
unset($app->getContainer()['errorHandler']);
unset($app->getContainer()['phpErrorHandler']);
```

## Configure the Bootstrapper debug mode

In `Include\Config.php`, set `$debugBootstrapper = true;`. If the variable is not already present in `Config.php`, you should add it.

This will cause the bootstrapper to write verbose logs as it sets up the environment.

The resulting debug log entries will be written to the log file for the current date (ending in `-app.log`).
