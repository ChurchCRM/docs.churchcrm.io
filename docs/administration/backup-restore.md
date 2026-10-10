---
title: Backup & Restore
sidebar_position: 8
---

# Backup / Restore

ChurchCRM has a built-in backup and restore tool that dumps your database (and optionally your uploaded images) to a single archive file that you can download, store off-site, or re-import later.

## Creating a backup

1. Log in as an administrator.
2. Open the **Admin Dashboard**. Backup is not in the Admin sidebar.
3. In **System Info**, click **Backup**. The page title is **Backup Database**.
4. Choose a backup type:
   - **Database Only** — database structure and data (`.sql`)
   - **Full Backup** — database plus uploaded photos (`.tar.gz`)
5. Click **Generate & Download Backup**. The file downloads to your browser. The archive is temporary and is deleted after the download.

:::tip Before every upgrade
Take a fresh backup before every upgrade. The [Upgrade Wizard](/administration/upgrade) also has a built-in backup step as part of the workflow.
:::

## Restoring a backup

1. On the **Admin Dashboard**, under **Advanced Operations**, click **Restore**. The page title is **Restore Database**.
2. Drag your backup archive onto the upload area (or click to browse). Supported files are `.sql`, `.sql.gz`, and `.tar.gz`.
3. Click **Restore Database**. The system replaces the current database with the contents of the backup.

:::caution Destructive operation
Restoring **replaces** your current data. If you have made changes since the backup was taken, those changes will be lost. Take a fresh backup of the current state first if you're not sure.
:::

## Remote backup

Remote backup is the plugin **External Backup (WebDAV)** under **Admin → Plugins**. Enable it, then set the WebDAV address, username, and password. When it is configured, **Backup Database** also offers **Backup to External Storage Now**.

ChurchCRM does not keep a copy of the downloadable archive on the server after you download it.

## Where backups live

The file you download is built in the system temporary directory and deleted after the download finishes. Do not look for a lasting backup folder inside the ChurchCRM install. See [File System Permissions](/administration/file-system-permissions) for the directories ChurchCRM does need to write.
