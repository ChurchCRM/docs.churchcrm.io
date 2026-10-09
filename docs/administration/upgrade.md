---
title: Upgrade Guide
sidebar_position: 7
---

# Upgrade Guide

ChurchCRM supports two upgrade paths: an **in-app wizard** (recommended) and a **manual file replacement**. Both automatically apply any pending database migrations on the next page load — no SQL scripts to run by hand.

:::warning Back up before every upgrade
Always take a database backup before upgrading. If something goes wrong, a backup is the only way to roll back cleanly. See [Backup & Restore](/administration/backup-restore).
:::

---

## Option 1 — In-App Upgrade Wizard (recommended)

### Step 1: Check for a new version

1. Log in as an administrator.
2. If a new version is available, a **download icon** appears in the top-right navbar.
3. Click it and select **New Release**, or go directly to **Admin → System → Upgrade**.
4. Click **Refresh from GitHub** to fetch the latest release info.

### Step 2: Back up

Click **Create Backup** on the wizard's backup step. Download and keep the file until you have verified the new version is working.

### Step 3: Download & apply

The wizard downloads the latest release from GitHub and applies it to your installation. Database migrations run automatically after the new files are in place.

### Step 4: Done

The system logs you out and redirects to the login page. Log back in — you are on the new version.

### File Integrity Check

The upgrade page also shows a **File Integrity Check** comparing your installed files against the official release. Use **Force Re-install** to re-download and restore the current version without upgrading (useful if a file was accidentally modified).

---

## Option 2 — Manual Upgrade

Use this if the in-app wizard fails, or if your server doesn't have outbound HTTP access.

### Step 1: Download the latest release

Download the zip from [https://github.com/ChurchCRM/CRM/releases/latest](https://github.com/ChurchCRM/CRM/releases/latest).

### Step 2: Back up everything

Before touching any files:

**Database backup** (via phpMyAdmin or command line):
```bash
mysqldump -u [username] -p [database_name] > churchcrm_backup_$(date +%Y%m%d).sql
```

**Config file backup:**
```bash
cp Include/Config.php Include/Config.php.bak
```

Optionally, snapshot the entire installation directory for a complete rollback option.

### Step 3: Replace the application files

Extract the zip and copy the new files over your existing installation:

```bash
unzip ChurchCRM-X.Y.Z.zip -d /tmp/churchcrm-new
cp -r /tmp/churchcrm-new/churchcrm/* /var/www/html/churchcrm/
```

On cPanel / shared hosting: upload via FTP or File Manager, extract, and overwrite the existing files.

### Step 4: Restore Config.php

If the upgrade overwrote your database connection file, restore it:

```bash
cp Include/Config.php.bak Include/Config.php
```

### Step 5: Run the database migration

Open ChurchCRM in your browser. The system automatically detects the version mismatch and applies pending database migrations on the next page load. No manual SQL steps needed.

:::note Downgrade detection
If your application files are **older** than the database schema (i.e., you accidentally rolled files back), the system stops and shows a warning rather than auto-migrating. Restore the correct version files to proceed.
:::

### Step 6: Verify

- Check the version number at the bottom of any page
- Browse People, Groups, and Finances to confirm data is intact
- Hard-refresh your browser (Ctrl+Shift+R / Cmd+Shift+R) to clear cached CSS and JS

---

## Upgrading from version 5.x (or older)

The current release cannot upgrade a 5.x database directly. Go through the **latest 6.x release** first, then move to the latest release. Do not skip the 6.x stop.

This works on shared hosting (cPanel or similar). The in-app wizard is not available on 5.x, so the first hop uses a manual file upload. After upgrading to 6.x, use the in-app wizard or a manual upload for the second hop.

### Step 1: Back up with the in-app backup

1. On your current version, go to **Admin → Backup**.
2. Choose **Database + images**. If the archive times out on your host, choose **Database only**.
3. Click **Create Backup** and download the file to your own computer. A backup that stays only on the server is lost if the site breaks.
4. Also copy `Include/Config.php` and download a copy of the site folder, or take a full cPanel backup.

### Step 2: Check your PHP and database versions

| Release | PHP | Database |
|---------|-----|----------|
| Any 6.x release | **8.2 or higher** (checked on every page load) | MySQL 8.0.11+ or MariaDB 10.5+ |
| 7.0.0 and later, including the latest release | **8.4 or higher** (checked on every page load) | MySQL 8.0.11+ or MariaDB 10.5+ |

- The app checks the PHP version itself and shows a warning if it is too old. It does not check the database version, so confirm it in cPanel (**MySQL Databases**, or phpMyAdmin's home page) before you start.
- If your database is older than the table says, ask your host to upgrade it before Step 3. Restoring a backup into an older database can fail.
- In cPanel, open **MultiPHP Manager** and switch the site to the PHP version the next step needs.
- Also see the [System Requirements](/installation/system-requirements) for the required PHP extensions.

:::caution Your host cannot offer PHP 8.4?
Stop at the latest 6.x release and stay on it. It is the newest release that runs on PHP 8.2 and 8.3. Do not use **Admin → System → Upgrade** there, because it installs the latest release, which needs PHP 8.4. Ask your host about PHP 8.4, or move to a host that offers it, before doing Step 4.
:::

### Step 3: Upgrade to the latest 6.x release

1. On the [GitHub releases page](https://github.com/ChurchCRM/CRM/releases), find the newest release whose version starts with 6 and download its zip.
2. Upload and extract it over your existing files. Overwrite everything, then restore your `Include/Config.php`.
3. Open ChurchCRM in your browser. The database migrates on the first page load.
4. Log in and check People, Families, Groups, and Finances.
5. Take another **Admin → Backup** and download it. This is your restore point for the next step.

### Step 4: Upgrade to the latest release

1. Set PHP to **8.4 or higher** (see Step 2).
2. Use **Admin → System → Upgrade**, or follow [Option 2 — Manual Upgrade](#option-2--manual-upgrade) if your host blocks outbound HTTPS.
3. Open the site. The remaining migrations run on the next page load.
4. Check the version number at the bottom of any page and run the **File Integrity Check** on the upgrade page.

### If something goes wrong

Put back the files you copied for that step, then go to **Admin → Restore** and load the backup you took before it. If the site no longer opens, restore the database dump from phpMyAdmin. See [Rollback](/administration/rollback).

:::tip Try it on a copy first
Make a second database and a subfolder, restore your backup into it, and run both steps there before touching the live site.
:::

---

## Troubleshooting upgrades

| Symptom | Likely cause | Fix |
|---------|-------------|-----|
| White screen / 500 error after upgrade | PHP version too old, or missing extension | Check the [System Requirements](/installation/system-requirements); review PHP error log |
| "Database Needs Upgrade" page won't go away | Config.php pointing to the wrong database | Verify `Include/Config.php` credentials |
| Old UI still showing after upgrade | Browser cached CSS/JS | Hard-refresh: Ctrl+Shift+R / Cmd+Shift+R |
| Permission errors on file write | Web server user lost write access after file copy | Run `chown -R www-data:www-data churchcrm` (Ubuntu) or `chown -R apache:apache churchcrm` (Rocky Linux) |
| In-app wizard says "no new version" | GitHub API rate-limited or server has no outbound HTTPS | Use manual upgrade; check server firewall |
| Rollback needed | Upgrade failed mid-way | Restore database from backup, restore files from backup — see [Rollback](/administration/rollback) |

---

## Auto-Upgrade on Boot

Pending database migrations run **automatically on the next page load** after new files are deployed — whether via the in-app wizard or a manual file copy. You no longer need to visit a separate migration page.

A **smart version check** prevents old application code from running against a newer database schema. If the app files are older than the database, ChurchCRM stops and shows a clear warning rather than attempting a potentially destructive migration.

---

## After upgrading

- Review **Admin → Get Started** for any new configuration options added in this version
- Check the [changelog](https://github.com/ChurchCRM/CRM/releases) for feature notes
- The docs site version of this page reflects the current release — if something looks different, check the [features overview](/getting-started/features-overview)
