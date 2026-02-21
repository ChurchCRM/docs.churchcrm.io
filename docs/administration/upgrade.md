---
title: Upgrade Guide
sidebar_position: 7
---

# Upgrade

## Automatic Upgrade

1. Login to the system with a user that is an `admin`
2. Review the Open Tasks Notification On the top right corner of the menu.
   ![Task Menu Icon](/img/Setup/admin-task-menu-1.png)
3. If there is a new version of the software, the version will be listed.
4. Follow the steps to backup, download, and install the release.
5. Go back to the main page, click the upgrade database button.
6. Login to your upgraded system.

## Manual Upgrades

1. Download the latest zip file from [https://github.com/ChurchCRM/CRM/releases/latest](https://github.com/ChurchCRM/CRM/releases/latest)
2. Move the zip file in the same level as the /churchcrm
3. Unzip the files over the existing files
4. Update [file permissions](File-System-Permissions).
5. Go back to the main page, click the upgrade database button.
6. Login to your upgraded system.

## 3.0.0 and 3.0.1 Automatic Upgrade Fix

Unfortunately, in the 3.0.0 release, a bug was introduced that prevents auto-upgrade from succeeding. This bug also affects 3.0.1. The good news is that it's an easy fix:

1. Ensure you have access to the deployed ChurchCRM code.
2. Edit the following File - `ChurchCRM/Service/SystemService.php`
3. Update Line 382 from `$release = $this->getLatestRelese();` to `$release = $this->getLatestRelease();`
4. Try the **Auto Upgrade** process listed at the top of this page.

## 3.2.0, 3.2.1 and 3.2.2 Automatic Upgrade Fix

Unfortunately, in the 3.2.0 release, a bug was introduced that prevents auto-upgrade from succeeding. This bug also affects 3.2.1 and 3.2.2. The good news is that it's an easy fix with a few options:

## Option 1

Replace line 159 of `UpgradeCRM.php` with this line before opening the upgrade wizard:

```js
      var downloadButton = "<button class=\"btn btn-primary\" id=\"downloadbutton\" role=\"button\" onclick=\"javascript:downloadbutton('"+data.BackupDownloadFileName+"')\"><i class='fa fa-download'></i>  "+data.BackupDownloadFileName+"</button>";
```

## Option 2

While in the upgrade wizard, open a your browser's developer tools console, and paste the following code to generate a backup, and allow the backup wizard to continue:

```js
window.CRM.APIRequest({
      method : 'POST',
      path : 'database/backup',
      data : JSON.stringify({
        'iArchiveType' : 3
      })
    })
    .done(function(data) {
      var downloadButton = "<button class=\"btn btn-primary\" id=\"downloadbutton\" role=\"button\" onclick=\"javascript:downloadbutton('"+data.BackupDownloadFileName+"')\"><i class='fa fa-download'></i>  "+data.BackupDownloadFileName+"</button>";
      $("#backupstatus").css("color","green");
      $("#backupstatus").html("<?= gettext('Backup Complete, Ready for Download.') ?>");
      $("#resultFiles").html(downloadButton);
      $("#status1").html('<i class="fa fa-check" style="color:orange"></i>');
      $("#downloadbutton").click(function(){
        $("#fetchPhase").show("slow");
        $("#backupPhase").slideUp();
        $("#status1").html('<i class="fa fa-check" style="color:green"></i>');
      });
    }).fail(function()  {
      $("#backupstatus").css("color","red");
      $("#backupstatus").html("<?= gettext('Backup Error.') ?>");
    });
```
