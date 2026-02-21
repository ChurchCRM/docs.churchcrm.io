---
title: 500 Error
sidebar_position: 13
---

# 500 Internal Server Error

When installing ChurchCRM on a hosting system, you may encounter the following error:

> Internal Server Error
>
> The server encountered an internal error or misconfiguration and was unable to complete your request.
>
> Please contact the server administrator to inform them of the time this error occurred and the actions you performed just before this error.
>
> More information about this error may be available in the server error log.
>
> Additionally, a 500 Internal Server Error was encountered while trying to use an ErrorDocument to handle the request.

## Check File Permissions

By default, files extracted from a zip archive may not have the correct permissions. You will see something like this in the Apache `error.log`:

> [Sun Feb 23 22:49:48.185584 2020] [:error] [pid 946920:tid 47367069935360] [client xxx.yyy.zzz.123:0] SoftException in Application.cpp:267: File "/path/to/ChurchCRM/Menu.php" is writeable by group, referrer: https://yoursite.domain.example/Menu.php

> [!NOTE]
> Instead of `writeable by group` you might see `execute bit set`, or similar messages.

See [File System Permissions](/administration/file-system-permissions) for the correct permission settings.

> [!WARNING]
> **Do not** set everything to mode 755. Some web servers use a more restrictive security model that causes problems when PHP scripts have the execute bit set. This is why files should be set **without** the execute bit. In more restrictive environments, group-writable files and directories can also cause 500 errors. This commonly affects customers on shared hosting (such as Bluehost or other cPanel-based providers).

[cPanel File Manager does not support recursive permission updates.](https://stackoverflow.com/questions/36170381/change-change-mode-of-all-files-and-folders-in-cpanel-at-once)

## Check Logs for Errors

cPanel includes a section for reviewing hosting errors. You can also check ChurchCRM application logs by navigating to **Admin** → **System Logs**. See [Logging & Diagnostics](/administration/logging-and-diagnostics) for more details.

## Check PHP Error Logs

If you are running your own server, review the PHP error logs for details. Error messages in the PHP log will often identify the root cause of a 500 error.
