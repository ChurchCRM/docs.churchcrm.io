---
title: Backup & Restore
sidebar_position: 8
---

# Backup / Restore

In "General Settings | System Settings", modify the following values:

![TODO-SCREENSHOT: System Settings backup configuration section showing external backup fields](/img/placeholder.png)

* **sEnableExternalBackupTarget**
  If you enable the external backup target, the system will allow you to do automatic and manual backups to a remote location specified below.

* **sExternalBackupType**
  Presently ChurchCRM supports backing up to the local filesystem, and to a WebDAV share. Enter either "Local" or "WebDAV" in this box.

* **sExternalBackupEndpoint**
  Enter either the local path, or the WebDAV URL here. HTTPS is preferred for WebDAV.

* **sExternalBackupUsername**
  If using WebDAV, enter the WebDAV username here.

* **sExternalBackupPassword**
  If using WebDAV, enter the WebDAV password here.

* **sExternalBackupAutoInterval**
  If you'd like backups to occur automatically, enter the interval (in hours) at which you would like an automatic backup to take place. ChurchCRM does not rotate backup files. ChurchCRM evaluates whether to make a backup with each page request, so the interval between backups is not guaranteed.
