---
title: FAQs
sidebar_position: 12
---

# Frequently Asked Questions

> 💬 **Have a question?** Post it on [GitHub Discussions](https://github.com/ChurchCRM/CRM/discussions) to get answers from the community!

## Installation

### How do I log into a fresh install?

The installation and setup process creates an admin user that you can use to create other users:

- **Username:** `admin`
- **Password:** `changeme`

Change this password immediately after your first login.

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

## How do I set up my logo or letterhead?

ChurchCRM uses two separate images: the **church logo** shown in the application and in emails, and the **letterhead** printed on PDF reports.

### Church logo (application and emails)

Upload the logo from **Admin → Church Information**. The **Church Logo** card shows the current image with **Upload** and **Remove** buttons — no file transfer is needed, and the uploaded logo survives upgrades.

- Accepted formats: PNG, JPG, GIF or WebP (not SVG). A wide banner of roughly 3.5:1, for example 700×200 pixels, works best; a transparent PNG is preferred.
- The image is scaled down to fit 1200×400 and stored as `Images/church-logo.png`.
- Once uploaded, it replaces the ChurchCRM branding in the sidebar (the church name text beside it is hidden), on the login page and the password-reset, two-factor, error, limited-access and change-password pages, and in emails.

See [First Run Configuration](/getting-started/first-run#church-logo) for a screenshot. The older `sChurchLogoURL` setting is now only a fallback for emails when no logo has been uploaded; the application pages ignore it.

### Letterhead (PDF reports)

Many reports and documents can include a letterhead. By default, ChurchCRM looks for these files in the `Images/` directory:
```
church_letterhead.jpg
church_letterhead.png
```

It may be tempting to simply upload your own artwork and rename the files as above, **but this is not "upgrade-safe"**. System upgrades will overwrite your files with the default ones again. The **correct method** is:
1. Ensure your letterhead is 500x80 pixels or an exact multiple of this ratio (eg. 1000x160 is also acceptable).
2. Your letterhead should be either PNG or JPEG/JPG format. Be aware only PNG supports transparency (*alpha channel*).
3. Upload your image to `/Images` using FTP/sFTP/SSH (*whatever your hosting provider supports*).
   eg. using SSH secure copy:

   ```scp my_fancy_letterhead.jpg user@hostingprovider:ChurchCRM/Images```
4. Log in to ChurchCRM with an admin account.
5. Go to **Admin** → **Edit General Settings** → **Report Settings**.
6. Set **sDirLetterHead** to `../Images/<your_file_name>` and click **Save Settings**.

   Replace `<your_file_name>` with the image you uploaded in step 3.