---
title: Upgrade Guide
sidebar_position: 7
---

# Upgrade

## Automatic Upgrade

ChurchCRM includes a built-in upgrade wizard that handles downloading, applying, and migrating your installation in a guided, step-by-step process.

### Checking for Updates

1. Log in to ChurchCRM with an admin account.
2. If a new version is available, a **download icon** (🡇) will appear in the top-right navbar.
3. Click the icon and select **New Release** to open the upgrade page, or navigate to **Admin → System → Upgrade** directly.
4. On the upgrade page, click **Refresh from GitHub** to check for the latest release.

### Running the Upgrade Wizard

The wizard guides you through four steps:

**Step 1 — Warnings (Pre-Upgrade Checks)**

Any modified or missing system files are listed here. If you have customized any application files and want to preserve those changes, back them up manually before proceeding. The upgrade will overwrite them with official versions.

**Step 2 — Database Backup**

Click **Create Backup** to download a full backup of your database before applying the update. It is strongly recommended not to skip this step. Keep the backup file until you have verified the new version is working correctly.

**Step 3 — Download & Apply**

The wizard downloads the latest release from GitHub and applies it to your installation. Database migrations run automatically after the new files are in place.

**Step 4 — Complete**

The upgrade is finished. The system will automatically log you out and redirect you to the login page. Log back in to begin using the upgraded version.

### File Integrity Check

The upgrade page also shows a **File Integrity Check** comparing your installed files against the official release. If files are missing or have been modified, you can use the **Force Re-install** button to re-download and restore the current version without upgrading to a newer release.

## Manual Upgrade

1. Download the latest release from [https://github.com/ChurchCRM/CRM/releases/latest](https://github.com/ChurchCRM/CRM/releases/latest).
2. Extract the zip file, overwriting the files in your existing `/churchcrm` installation directory.
3. Update [file permissions](/administration/file-system-permissions).
4. Open your ChurchCRM URL in a browser. The database is migrated automatically on the next page load — no manual SQL steps are required.
5. Log in to your upgraded system.

### Automatic database migration on boot

As of ChurchCRM 7.1, database migrations run **automatically on the first request after a new version's files are in place**. You no longer see a "Database Needs Upgrade" page during a normal upgrade — the system detects the version mismatch, applies the pending migrations, and continues to the requested page.

The manual database-upgrade page is still shown in one specific situation: if the installed application code is **older** than the schema (for example, you rolled files back without restoring the database). In that case the system stops and asks for manual intervention, because downgrading a schema is not safe to do automatically.

:::tip Before upgrading a production site
Even though migrations are automatic, always take a fresh backup first — either from the built-in **Admin → Backup** page or via the upgrade wizard's built-in backup step.
:::
