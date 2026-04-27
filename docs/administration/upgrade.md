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
- The docs site version of this page reflects the current release — if something looks different, check [What's new in 7.1](/getting-started/features-overview#whats-new-in-71)
