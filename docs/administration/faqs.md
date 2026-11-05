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

On a fresh install your site's address opens the staff sign-in page at `/admin/`. Change this password immediately after your first login.

### Where do staff sign in?

At `/admin/` on your site, for example `https://www.yourchurch.org/admin/`, or `/churchcrm/admin/` when ChurchCRM is in a folder. Old `/session/begin` bookmarks open the same form.

What the site's home page opens depends on two settings:

- **Member sign-in on:** the member sign-in page. It has no staff link, so staff go to `/admin/` directly.
- **Member sign-in off, Self-Registration on:** a welcome page with **Register your family** and a **Church leader sign-in** link to `/admin/`.
- **Both off**, as on a fresh install: the staff sign-in page.

### How do members sign in?

With their own email address, once an administrator turns member sign-in on. They open the site's home page, type their email and click **Email me a code**. ChurchCRM emails them a code and a link; there is no member password. On their own device they can stay signed in or add a passkey. See [Member sign-in](/administration/member-sign-in), and send members [Signing in to the Member Portal](/user-guide/member-sign-in).

### How do I upgrade from version 5.x to the current release?

Go through the latest 6.x release first. The current release has no upgrade steps for a 5.x database.

1. Take an in-app backup from the **Admin Dashboard** (**System Info → Backup**). Choose **Full Backup** (or **Database Only** if the full archive times out) and click **Generate & Download Backup**.
2. Check your database is MySQL @@mysql@@+ or MariaDB @@mariadb@@+. Set your host to PHP 8.2 or higher and upload the newest 6.x zip from the [releases page](https://github.com/ChurchCRM/CRM/releases) over your files. Keep your `Include/Config.php`.
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

Set the log level on **System Logs → Settings** (on the Admin Dashboard, **View Logs** under **Advanced Operations**). The default is INFO, but you may want to change that. The logs are created in the `/logs` dir. Please note that logs are not cleaned by the system and it is up to the admin to clean files.

## How do I upload my church logo?

Go to **Admin** → **Church Information** and use the logo upload dialog.

- Pick a PNG, JPG, GIF or WebP (not SVG) up to 50 MB. Your browser shrinks it to the stored size (1200x400) and never enlarges it.
- The logo dialog has no webcam option.
- HEIC/HEIF images are converted to JPEG in your browser when you pick them. If the conversion fails, export the image as JPEG or PNG and try again.
- API callers that skip the browser are limited to 16 megapixels of source image.

## How do I set up my logo or letterhead?

ChurchCRM uses two separate images: the **church logo** shown in the application and in emails, and the **letterhead** printed on PDF reports.

### Church logo (application and emails)

Upload the logo from **Admin → Church Information**. The **Church Logo** card shows the current image with an **Upload** button, and a **Remove** button once a logo has been uploaded. No file transfer is needed, and the uploaded logo survives upgrades.

- Accepted formats: PNG, JPG, GIF or WebP (not SVG), picked from a file of up to 50 MB (no webcam option). An iPhone HEIC photo is converted to JPEG in the browser first. A wide banner of roughly 3.5:1, for example 700×200 pixels, works best; a transparent PNG is preferred.
- The browser scales the image down to fit 1200×400 before uploading it, and it is stored as `Images/church-logo.png`. Uploads made directly through the API are limited to 16 megapixels.
- Once uploaded, it replaces the ChurchCRM branding in the sidebar (the church name text beside it is hidden), on the login page and the password-reset, two-factor, error, limited-access and change-password pages, and in emails.

See [First Run Configuration](/getting-started/first-run#church-logo) for a screenshot. The older `sChurchLogoURL` setting is now only a fallback for emails when no logo has been uploaded; the application pages ignore it.

### Letterhead (PDF reports)

Many reports and documents can include a letterhead. Without one, letters print the church name and address instead. Set one up from the admin UI — no file transfer is needed:

1. Log in to ChurchCRM with an admin account.
2. Go to **Reports → Admin → Report Settings**.
3. On the **Letterhead** card, upload your image. It is stored as `Images/church-letterhead.png`, so it survives upgrades, and you can preview it or remove it from the same card.
4. Use a PNG, JPG, GIF or WebP image. A wide banner works best, for example 2000x300. Be aware only PNG supports transparency (*alpha channel*).

A letterhead path previously saved in `bDirLetterHead` still works as a fallback when no letterhead has been uploaded here.
