---
title: FAQs
sidebar_position: 12
---

# Frequently Asked Questions

> 💬 **Have a question?** Ask in the [ChurchCRM Community Chat](https://discord.gg/tuWyFzj3Nj). For reproducible software bugs, use [GitHub Issues](https://github.com/ChurchCRM/CRM/issues).

## Installation

### How do I log into a fresh install?

The installation and setup process creates an admin user that you can use to create other users:

- **Username:** `admin`
- **Password:** `changeme`

Change this password immediately after your first login.

### How do I upgrade from version 5.x to the current release?

Go through the latest 6.x release first. The current release has no upgrade steps for a 5.x database.

1. Take an in-app backup from the **Admin Dashboard** (**System Info → Backup**). Choose **Full Backup** (or **Database Only** if the full archive times out) and click **Generate & Download Backup**.
2. Check your database is MySQL 8.0.11+ or MariaDB 10.5+. Set your host to PHP 8.2 or higher and upload the newest 6.x zip from the [releases page](https://github.com/ChurchCRM/CRM/releases) over your files. Keep your `Include/Config.php`.
3. Open the site so the database migrates, check it works, and take another backup.
4. Set PHP to 8.4 or higher and upgrade to the latest release. If your host cannot offer PHP 8.4, stay on the latest 6.x release.

Full steps, including shared hosting notes: [Upgrading from version 5.x](/administration/upgrade#upgrading-from-version-5x-or-older).

## I get "Too Many Redirects" or errors while making API calls

Please check whether mod_rewrite is working on your server. In addition, read the comment thread at [#3153](https://github.com/ChurchCRM/CRM/issues/3153) for more steps on how to diagnose mod_rewrite.

## Apache2 VirtualHost Config

see [https://github.com/ChurchCRM/CRM/blob/master/cloud9/001-cloud9.conf](https://github.com/ChurchCRM/CRM/blob/master/cloud9/001-cloud9.conf) for the config used by our cloud9 dev system.

## Internal Server Error 500

In most cases the cause is incorrect file permissions. See the [Troubleshooting — 500 Internal Server Error](/administration/troubleshooting#500-internal-server-error) section and [File System Permissions](/administration/file-system-permissions).

## Error reporting in PHP

To see more detailed errors during troubleshooting, edit your `Include/Config.php` (or the `.example` from the [ChurchCRM source](https://github.com/ChurchCRM/CRM/blob/master/src/Include/Config.php.example)) and change:

`error_reporting(E_ERROR);` to `error_reporting(E_ALL);`

See the [PHP error reporting constants](https://www.php.net/manual/en/errorfunc.constants.php) for other options.

## Debug

Explore various methods for debugging the ChurchCRM application, including turning on error reporting and enabling app logs.

Enable the logs in the System Settings, the default value is INFO but you may want to change that. The logs are created in the `/logs` dir. Please note that logs are not cleaned by the system and it is up to the admin to clean files.

## How do I upload my church logo?

Go to **Admin** → **Church Information** and use the logo upload dialog.

- Pick any JPEG or PNG up to 50 MB. Your browser shrinks it to the stored size (1200x400) and never enlarges it.
- The logo dialog has no webcam option.
- HEIC/HEIF images are converted to JPEG in your browser when you pick them. If the conversion fails, export the image as JPEG or PNG and try again.
- API callers that skip the browser are limited to 16 megapixels of source image.

## How do I set up my logo or letterhead?

Many reports and documents can include a logo or letterhead. By default, ChurchCRM looks for these files in the `Images/` directory:
```
church_letterhead.jpg
church_letterhead.png
```

It may be tempting to simply upload your own artwork and rename the files as above, **but this is not "upgrade-safe"**. System upgrades will overwrite your files with the default ones again. The **correct method** is:
1. Ensure your letterhead or logo is 500x80 pixels or an exact multiple of this ratio (eg. 1000x160 is also acceptable).
2. Your logo should be either PNG or JPEG/JPG format. Be aware only PNG supports transparency (*alpha channel*).
3. Upload your image to `/Images` using FTP/sFTP/SSH (*whatever your hosting provider supports*).
   eg. using SSH secure copy:

   ```scp my_fancy_letterhead.jpg user@hostingprovider:ChurchCRM/Images```
4. Log in to ChurchCRM with an admin account.
5. Go to **Admin → System Settings → Report Settings**.
6. Set **bDirLetterHead** to `../Images/<your_file_name>` and click **Save Settings**.

   Replace `<your_file_name>` with the image you uploaded in step 3.