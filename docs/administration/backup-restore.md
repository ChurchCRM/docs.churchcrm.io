---
title: Backup & Restore
sidebar_position: 8
---

# Backup / Restore

ChurchCRM has a built-in backup and restore tool that dumps your database (and optionally your uploaded images) to a single archive file that you can download, store off-site, or re-import later.

## Creating a backup

1. Log in as an administrator.
2. Go to **Admin → Backup**.
3. Choose what to include:
   - **Database only** — smallest file, fastest, recovers all records
   - **Database + images** — includes photos and attachments (recommended for a full restore)
   - **Encrypted** — optional password-protected archive
4. Click **Create Backup**. The file downloads to your browser.

:::tip Before every upgrade
Take a fresh backup before every upgrade. The [Upgrade Wizard](/administration/upgrade) also has a built-in backup step as part of the workflow.
:::

## Restoring a backup

1. Go to **Admin → Restore**.
2. Drag your backup archive onto the upload area (or click to browse).
3. If the archive is encrypted, enter the password.
4. Click **Restore**. The system replaces the current database with the contents of the backup and validates any included image files before writing them to disk.

:::caution Destructive operation
Restoring **replaces** your current data. If you have made changes since the backup was taken, those changes will be lost. Take a fresh backup of the current state first if you're not sure.
:::

## Automatic / external backups

ChurchCRM can automatically push backups to an external location. Open **Admin → System Settings** and configure:

| Setting | Purpose |
|---------|---------|
| **sEnableExternalBackupTarget** | Enable the external backup feature |
| **sExternalBackupType** | `Local` (server filesystem) or `WebDAV` |
| **sExternalBackupEndpoint** | Local path or WebDAV URL (HTTPS strongly recommended) |
| **sExternalBackupUsername** | WebDAV username (if applicable) |
| **sExternalBackupPassword** | WebDAV password (if applicable) |
| **sExternalBackupAutoInterval** | Interval in hours between automatic backups |

ChurchCRM evaluates the auto-backup schedule on each page request, so the actual gap between backups depends on site activity. ChurchCRM does **not** rotate external backup files — clean them up yourself (or via your backup destination's lifecycle rules) to keep storage under control.

## Where backups live

Local backups are written under the `churchcrm/tmp_attach/` directory. Make sure this directory is **not** publicly accessible through the web server — see [File System Permissions](/administration/file-system-permissions).
