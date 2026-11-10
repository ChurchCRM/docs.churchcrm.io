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

:::info Upgrading to a release with member sign-in
The upgrade changes how people sign in. Take a backup first: it is the only way back.

- **Self-service logins are removed.** Every user account that had *Edit Self* on and was not an administrator is deleted, whatever other rights it had. The person records stay, and each person's timeline gets the note *Member Portal account removed by the upgrade* from *System Upgrade*. Their calendar subscriptions keep working while member sign-in is off; once it is on, only for people the sign-in rules let in.
- **Member sign-in is off** until you turn it on at **Admin → Member Portal → Sign-in**. Members then sign in with their own email address, so ChurchCRM must be able to send email ([Email Setup](./email-setup.md)). If the upgrade removed any logins, the Admin Dashboard shows **Member sign-in is off** with how many people used to sign in, until you turn member sign-in on or click **Dismiss**.
- **Family emails move to people.** Each family email goes to the oldest head of household who has no email of their own, or else the oldest such spouse. Nothing moves when someone already has that address as their own email. When nobody can take it, the family's timeline gets a note, and **Family emails not moved** on **Admin → Member Portal → Members** lists the family. In a family of two or more people, a moved address can't be used to sign in until staff confirm it: **Email needs attention** on the same tab lists them, with **Confirm selected**.
- **Staff sign in at `/admin/`.** Old `/session/begin` links and bookmarks still open the same sign-in form.

See [Member sign-in → After the upgrade](./member-sign-in.md#after-the-upgrade). If you upgrade from a release without the Member Portal, also read [Member Portal → For administrators upgrading](./member-portal.md#for-administrators-upgrading).
:::

---

## Option 1 — In-App Upgrade Wizard (recommended)

### Step 1: Check for a new version

1. Sign in at `/admin/` as an administrator.
2. If a new version is available, a **download icon** appears in the top-right navbar.
3. Click it and select **New Release**, or open the **Admin Dashboard**, then **System Info**, and click **Upgrade**. Upgrade is not in the Admin sidebar. The page title is **System Upgrade**.
4. Click **Refresh** to fetch the latest release info.

### Step 2: Back up

Click **Create Backup** on the wizard's backup step. Download and keep the file until you have verified the new version is working.

### Step 3: Download & apply

The wizard downloads the latest release from GitHub and applies it to your installation. Database migrations run automatically after the new files are in place.

### Step 4: Done

A **Database Upgrade** page asks you to keep it open while the database is updated. When it finishes, ChurchCRM signs you out and opens the staff sign-in page at `/admin/` (after a one-step update it takes you straight back to the dashboard instead). Sign back in — you are on the new version.

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

1. On your current version, open the in-app backup and download it. On the current release that is **Admin Dashboard → System Info → Backup** — there is no Backup item in the Admin sidebar.
2. Choose **Full Backup**. If the archive times out on your host, choose **Database Only**.
3. Click **Generate & Download Backup** and keep the file on your own computer. The archive is deleted from the server after download.
4. Also copy `Include/Config.php` and download a copy of the site folder, or take a full cPanel backup.

### Step 2: Check your PHP and database versions

| Release | PHP | Database |
|---------|-----|----------|
| Any 6.x release | **8.2 or higher** (checked on every page load) | MySQL @@mysql@@+ or MariaDB @@mariadb@@+ |
| 7.0.0 and later, including the latest release | **8.4 or higher** (checked on every page load) | MySQL @@mysql@@+ or MariaDB @@mariadb@@+ |

- The app checks the PHP version itself and shows a warning if it is too old. It does not check the database version, so confirm it in cPanel (**MySQL Databases**, or phpMyAdmin's home page) before you start.
- If your database is older than the table says, ask your host to upgrade it before Step 3. Restoring a backup into an older database can fail.
- In cPanel, open **MultiPHP Manager** and switch the site to the PHP version the next step needs.
- Also see the [System Requirements](/installation/system-requirements) for the required PHP extensions.

:::caution Your host cannot offer PHP 8.4?
Stop at the latest 6.x release and stay on it. It is the newest release that runs on PHP 8.2 and 8.3. Do not click **Upgrade** on the Admin Dashboard there, because it installs the latest release, which needs PHP 8.4. Ask your host about PHP 8.4, or move to a host that offers it, before doing Step 4.
:::

### Step 3: Upgrade to the latest 6.x release

1. On the [GitHub releases page](https://github.com/ChurchCRM/CRM/releases), find the newest release whose version starts with 6 and download its zip.
2. Upload and extract it over your existing files. Overwrite everything, then restore your `Include/Config.php`.
3. Open ChurchCRM in your browser. The database migrates on the first page load.
4. Log in and check People, Families, Groups, and Finances.
5. Take another backup from the Admin Dashboard (**System Info → Backup**) and download it. This is your restore point for the next step.

### Step 4: Upgrade to the latest release

1. Set PHP to **8.4 or higher** (see Step 2).
2. On the **Admin Dashboard**, click **Upgrade** under **System Info**, or follow [Option 2 — Manual Upgrade](#option-2--manual-upgrade) if your host blocks outbound HTTPS. The wizard still has a **Create Backup** step. If it lists leftover files, **Review & Delete** opens **Orphaned Files Management**.
3. Open the site. The remaining migrations run on the next page load.
4. Check the version number at the bottom of any page and run the **File Integrity Check** on the upgrade page.

### If something goes wrong

Put back the files you copied for that step, then open **Restore Database** from the Admin Dashboard (**Advanced Operations → Restore**) and click **Restore Database**. If the site no longer opens, restore the database dump from phpMyAdmin. See [Rollback](/administration/rollback).

:::tip Try it on a copy first
Make a second database and a subfolder, restore your backup into it, and run both steps there before touching the live site.
:::

---

## Upgrading from ChurchInfo

ChurchInfo 1.2.14, 1.3.0, 1.3.1 and 1.3.2 are supported by the in-app upgrader. Restore the ChurchInfo backup into a fresh ChurchCRM install and the upgrader brings the database forward to the latest release with no manual steps.

| Starting point | Supported by the in-app upgrader? |
|----------------|-----------------------------------|
| ChurchInfo 1.2.14 – 1.3.2 | Yes, straight to the latest release |
| ChurchCRM 2.x – 5.x | No. Follow [Upgrading from version 5.x](#upgrading-from-version-5x-or-older) |
| ChurchCRM 6.0.0 and above | Yes |

The upgrader does nothing (and logs a warning) if it does not recognise your starting version, so your data is not at risk.

### Step 1: Back up your ChurchInfo database

Export it as a `.sql` file using phpMyAdmin or your host's tools. Do this before anything else.

### Step 2: Install ChurchCRM

Download the latest release and run the setup wizard. Allow about 10 minutes on shared hosting.

### Step 3: Restore your ChurchInfo backup

During setup you are prompted to restore from a backup. Upload your ChurchInfo `.sql` file. ChurchCRM recognises the format and upgrades the schema automatically.

### Step 4: Verify

Spot-check a few family records, confirm giving history, and configure email settings.

- **Carried over:** members and families, contact info, group memberships, donation and pledge history
- **Set up fresh:** user accounts and passwords, SMTP settings, church name and logo

---

## Troubleshooting upgrades

| Symptom | Likely cause | Fix |
|---------|-------------|-----|
| White screen / 500 error after upgrade | PHP version too old, or missing extension | Check the [System Requirements](/installation/system-requirements); review PHP error log |
| "Database Needs Upgrade" page won't go away | Config.php pointing to the wrong database | Verify `Include/Config.php` credentials |
| Old UI still showing after upgrade | Browser cached CSS/JS | Hard-refresh: Ctrl+Shift+R / Cmd+Shift+R |
| Permission errors on file write | Web server user lost write access after file copy | Run `chown -R www-data:www-data churchcrm` (Ubuntu) or `chown -R apache:apache churchcrm` (Rocky Linux) |
| In-app wizard says "no new version" | GitHub API rate-limited or server has no outbound HTTPS | Use manual upgrade; check server firewall |
| Database upgrade stops with `Specified key was too long` (error 1071) | Database server older than MySQL @@mysql@@+ or MariaDB @@mariadb@@+ | Move to a supported database; see [Upgrade stops with "Specified key was too long"](#upgrade-stops-with-specified-key-was-too-long) |
| Upgrade wizard shows an error after it copied the files | The wizard stopped before the database step | Reload the site; the database upgrade runs on the next page load. If it fails, see "Database Upgrade Failed" below |
| Database upgrade stops with `Specified key was too long` (error 1071) | Database server older than MySQL @@mysql@@+ or MariaDB @@mariadb@@+ | Move to a supported database. See [Upgrade stops with "Specified key was too long"](#upgrade-stops-with-specified-key-was-too-long) |
| The wizard shows an error after it copied the files | The wizard stopped before the database step | Reload the site. The database upgrade runs on the next page load. If it fails, see "Database Upgrade Failed" below |
| Rollback needed | Upgrade failed mid-way | Restore database from backup, restore files from backup — see [Rollback](/administration/rollback) |

### "Database Upgrade Failed" — what the error means

If the database migration fails, ChurchCRM shows a **Database Upgrade Failed** page with the current database version, the current software version, and the error in a red box. The wording of that error tells you which kind of failure it is:

- **A SQL error naming a column or table, such as `Duplicate column name '...'` or `COLUMN already exists`.** The migration tried to add something that is already in your database. Do not edit the upgrade SQL files to work around it. Restore the database and files from the backup you took before upgrading (see [Rollback](/administration/rollback)), then report the failure with the error text and your app log so the migration can be fixed — see [Logging & Diagnostics](/administration/logging-and-diagnostics).
- **"Upgrade file ... failed or was interrupted."** A previous upgrade attempt stopped part-way through — for example the request timed out, or the **Database Upgrade** page was closed while it was still running. ChurchCRM records each migration script as it runs, and will not re-run a script that stopped part-way through. Check the app log (`logs/yyyy-mm-dd-app.log`) for which script started, restore the database and files from the pre-upgrade backup, and run the upgrade again, keeping the **Database Upgrade** page open until it finishes.

In both cases, do not just reload the page and hope the upgrade completes: a failed or interrupted migration has to be repaired or restored first.

### Upgrade stops with "Specified key was too long"

The database upgrade fails with `SQLSTATE[42000] ... 1071 Specified key was too long; max key length is 767 bytes`, and the site keeps showing **Database Upgrade Failed**. Your database server is older than ChurchCRM supports (MySQL @@mysql@@+ or MariaDB @@mariadb@@+). Servers such as MariaDB 10.0 and MySQL 5.5 or 5.6 limit index size to 767 bytes, and newer releases create indexes that need more.

To recover:

1. Find your database version under **System Info** on the Admin Dashboard, or in phpMyAdmin's home page.
2. Restore the database backup you took before the upgrade (**Advanced Operations → Restore**, or import the dump in phpMyAdmin). A failed upgrade can leave new tables behind, so do not retry on top of it.
3. Ask your host to move your database to MySQL @@mysql@@+ or MariaDB @@mariadb@@+. A new database on a newer server also works: import your dump into it, then update the database name, user, and password in `Include/Config.php`.
4. Run the upgrade again.

If your host cannot offer a supported database, stay on the release you have. Do not edit the upgrade SQL files.

### Upgrade stops with "Specified key was too long"

The database upgrade fails with `SQLSTATE[42000] ... 1071 Specified key was too long; max key length is 767 bytes`. Your database server is older than ChurchCRM supports (MySQL @@mysql@@+ or MariaDB @@mariadb@@+). Old servers such as MariaDB 10.0 or MySQL 5.5 and 5.6 cap index size at 767 bytes, and newer releases create indexes that need more. The site then keeps showing the **Database Upgrade Failed** page.

The check **System Info** on the Admin Dashboard shows your database version. To recover:

1. Restore the database backup you took before the upgrade (**Advanced Operations → Restore**, or import the dump in phpMyAdmin). A failed upgrade can leave some new tables behind, so do not retry on top of it.
2. Ask your host to move your database to MySQL @@mysql@@+ or MariaDB @@mariadb@@+. On cPanel, check **MySQL Databases** or ask support. A new database on a newer server also works: import your dump into it and update the database name, user, and password in `Include/Config.php`.
3. Run the upgrade again.

If your host cannot offer a supported database, stay on the release you have. Do not edit the upgrade SQL files.

---

## Auto-Upgrade on Boot

Pending database migrations run **automatically on the next page load** after new files are deployed — whether via the in-app wizard or a manual file copy. You no longer need to visit a separate migration page.

A **smart version check** prevents old application code from running against a newer database schema. If the app files are older than the database, ChurchCRM stops and shows a clear warning rather than attempting a potentially destructive migration.

---

## After upgrading

- Review **Admin → Get Started** for any new configuration options added in this version
- Check the [changelog](https://github.com/ChurchCRM/CRM/releases) for feature notes
- The docs site version of this page reflects the current release — if something looks different, check the [features overview](/getting-started/features-overview)
